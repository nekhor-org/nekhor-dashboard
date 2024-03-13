#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
class GetPublicationsJob < ApplicationJob

  def perform

    # Fetch and parse HTML document
    doc = Nokogiri::HTML(URI.open('https://www.nekhor.org/news'))

    
    # Search for nodes by css
    doc.css('.entry.h-entry.hentry.author-stefan-mang.post-type-text').each do |link|
      above_title = link.css(".meta-above-title .entry-dateline a").text
      title = link.css(".meta-above-title .entry-dateline a")
      subtitle = link.css(".sqs-html-content h3")
      subtitle2 = link.css(".sqs-html-content")
      content = link.css(".sqs-html-content")

      puts above_title
    end


    return true
  end
end