require 'httparty'
require 'nokogiri'
require 'openssl'
require 'open-uri'

module WpRoster
  module Browser
    class HtmlParser < HTTParty::Parser
      SupportedFormats.merge!('text/html' => :html)

      def html
        Nokogiri::HTML(body)
      end
    end

    class Scraper
      include HTTParty

      format   :html
      parser   HtmlParser
      headers 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36'
    end

    attr_accessor :url

    def document 
      @document ||= retrieve(@url)
    end

    def retrieve url
      res = Scraper.get(url)
      
      if res.code != 200
        if res.code == 404
          raise NotFoundError
        else
          raise Error, "error: #{res.code}"
        end
      end

      res
    end
  end

  class Error < StandardError 
  end

  class NotFoundError < Error
  end
end