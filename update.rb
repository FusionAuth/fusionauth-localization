#!/usr/bin/env ruby

WORKING_DIR = File.dirname(__FILE__)

def handleMultiLine(multiLine, line)
  keyOrComment = line
  text = ''
  if multiLine != ''
    keyOrComment = multiLine + '~2'
    text = line
    multiLine = ''
  else
    line.match(/^([^#][^=]*)=(.*)/) do |data|
      keyOrComment = data[1]
      text = data[2]
      if /.*\\$/.match?(data[2])
        multiLine = data[1]
        keyOrComment += '~1'
      end
    end
  end
  return keyOrComment, text
end

def loadMessages (file)
  properties = {}
  multiLine = ''
  IO.foreach(file) do |line|
    line.strip
    newLine = handleMultiLine(multiLine, line)
    properties[newLine[0]] = newLine[1] if newLine[0] != ''
  end
  properties
end

# Load messages.properties
mainFile = []

multiLine = ''
IO.foreach("#{WORKING_DIR}/theme/messages.properties") do |line|
  line.chomp
  newLine = handleMultiLine(multiLine, line)
#   line = line.gsub(/([^=]*)=(.*)/, '\1') if line =~ /([^#][^=]*)=(.*)/
#   line = line + '~1' if line =~ /([^#][^=]*)=(.*)\//
#   line = multiLine + '~2' if line =~ /  \S/

  mainFile.push(newLine[0])
end

englishMessages = loadMessages("#{WORKING_DIR}/theme/messages.properties")
Dir.foreach("#{WORKING_DIR}/theme") do |filename|
  next if !filename.match?('_')

  translatedMessages = loadMessages("#{WORKING_DIR}/theme/#{filename}")
  newTranslations = []
  missingTranslations = []
  mainFile.each do |line|
    hasKey = translatedMessages.has_key?(line)
    if (/^\s*(#|$)/.match?(line)) || hasKey
      line += "=#{translatedMessages[line]}" if hasKey
      newTranslations.push(line)
    else
      missingTranslations.push("#{line}=#{englishMessages[line]}")
    end
  end

  File.open("#{WORKING_DIR}/theme/#{filename}", "w+") do |f|
    f.puts(missingTranslations)
  end

  File.open("#{WORKING_DIR}/missing-translations/#{filename}", "w+") do |f|
    f.puts(missingTranslations)
  end
end
