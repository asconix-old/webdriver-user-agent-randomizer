#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

BASE_URL = "http://www.useragentstring.com/pages/Browserlist/"
UA_FILE = "../lib/user_agents.txt"

begin
  doc = Nokogiri::HTML(open(BASE_URL))
rescue Exception => e
  puts e
end

File.open(UA_FILE, 'w') do |f|
  doc.xpath('//li/a').each do |item|
    f.write("#{item.content}\n")
  end
end



