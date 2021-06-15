#!/usr/bin/env ruby

WORKING_DIR = File.dirname(__FILE__)

def handleMultiLine(currentLine, lastPropertyName, isMultiLine)
  propertyName = ''
  propertyValue = ''
  comment = ''

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

  return propertyName, propertyValue, comment, isMultiLine
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
    if propertyName != ''
      if properties.has_key?(propertyName)
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
