#!/usr/bin/env ruby

require 'optparse'
require 'ostruct'
require 'ostruct'

# Parse the options
options = OpenStruct.new
oparser = OptionParser.new do |opts|
  opts.banner = 'Usage: update.rb'
  opts.separator ''
  opts.separator 'Description: Updates the translation files in theme and missing-translations.'
  opts.separator ''
  opts.separator 'Files in theme/ will be reordered to match the messages.properties (English) ordering of comments and keys.'\
    ' Files in missing-translations/ will be updated to reflect any missing translations (i.e. keys may be added or removed).'
  opts.separator ''
  opts.separator 'Options:'

  opts.on_tail('-h', '--help', 'Display this message') do
    puts opts
    exit
  end
end
oparser.parse!

# Update theme/ and missing-translations/ files.
WORKING_DIR = File.dirname(__FILE__)

def handleMultiLine(currentLine, lastPropertyName, isMultiLine)
  propertyName = ''
  propertyValue = ''
  comment = ''
  wasMultiLine = isMultiLine

  if isMultiLine
    propertyName = lastPropertyName
    propertyValue = currentLine.strip().chomp('\\')
    isMultiLine = /.*\\$/.match?(currentLine)
  elsif /^[^#][^=]*=.*/.match(currentLine)
    currentLine.strip.match(/^([^#][^=]*)=(.*)/) do |data|
      propertyName = data[1]
      propertyValue = data[2].chomp('\\')
      isMultiLine = /.*\\$/.match?(data[2])
    end
  else
    comment = currentLine.chomp
  end

  return propertyName, propertyValue, comment, isMultiLine, wasMultiLine
end

def loadMessages (file)
  properties = {}
  lastPropertyName = ''
  isMultiLine = false

  IO.foreach(file) do |currentLine|
    data = handleMultiLine(currentLine, lastPropertyName, isMultiLine)
    propertyName = data[0]
    propertyValue = data[1]
    isMultiLine = data[3]
    wasMultiLine = data[4]
    if propertyName != ''
      if properties.has_key?(propertyName)
        if !wasMultiLine
          abort('Stopping! Duplicate key ' + propertyName + ' in file ' + file)
        end
        properties[propertyName] += " " + propertyValue
      else
        properties[propertyName] = propertyValue
      end
      properties[propertyName] = properties[propertyName].gsub(/\s+/, ' ')
    end
    lastPropertyName = propertyName
  end

  return properties
end

# Load messages.properties
mainFileTemplate = []
isMultiLine = false

IO.foreach("#{WORKING_DIR}/theme/messages.properties") do |currentLine|
  data = handleMultiLine(currentLine, '', isMultiLine)
  propertyName = data[0]
  comment = data[2]

  if propertyName != ''
    mainFileTemplate.push(propertyName)
  elsif !isMultiLine
    mainFileTemplate.push(comment)
  end

  # Update isMultiLine now otherwise we will output blank lines when comment == '', but is
  # actually 2nd part of a multiline.
  isMultiLine = data[3]
end

# Add an extra line return to match the build output
File.open("#{WORKING_DIR}/theme/messages.properties", "a") do |f|
  f.write "\n"
end

englishMessages = loadMessages("#{WORKING_DIR}/theme/messages.properties")
Dir.foreach("#{WORKING_DIR}/theme") do |filename|
  next if !filename.match?('properties')

  translatedMessages = loadMessages("#{WORKING_DIR}/theme/#{filename}")
  newTranslations = []
  missingTranslations = []
  mainFileTemplate.each do |line|
    hasKey = translatedMessages.has_key?(line)
    if (/^\s*(#|$)/.match?(line)) || hasKey
      line += "=#{translatedMessages[line]}" if hasKey
      newTranslations.push(line)
    else
      missingTranslations.push("#{line}=#{englishMessages[line]}")
    end
  end

  File.open("#{WORKING_DIR}/theme/#{filename}", "w+") do |f|
    f.puts(newTranslations)
  end

  filename = "#{WORKING_DIR}/missing-translations/#{filename}"
  if missingTranslations.length == 0
    File.delete(filename) if File.exist?(filename)
  else
    File.open(filename, "w+") do |f|
      f.puts(missingTranslations)
    end
  end
end
