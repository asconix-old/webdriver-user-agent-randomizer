require 'selenium-webdriver'
require 'facets/hash/except'
require 'yaml'
require 'json'

UA_FILE = "../user_agents.txt"

module UserAgent
  def self.driver options={} 
    options[:browser] ||= :firefox

    user_agent = ua_pool[Random.rand(ua_pool.size)]

    case options[:browser]
      when :firefox
        options[:profile] ||= Selenium::WebDriver::Firefox::Profile.new
        options[:profile]['general.useragent.override'] = user_agent
      when :chrome
        options[:switches] ||= []
        options[:switches] << "--user-agent=#{user_agent}"
      else
        raise "WebDriver UserAgent currently only supports :firefox and :chrome."
    end
    driver = Selenium::WebDriver.for options[:browser], options.except(:browser)
    driver
  end

  def self.ua_pool
    @ua_pool = []
    ua_file = File.open(File.expand_path(UA_FILE, __FILE__), 'r') do |f|
      f.readlines
    end
    ua_file.each do |ua|
      @ua_pool << ua
    end
    @ua_pool
  end

end