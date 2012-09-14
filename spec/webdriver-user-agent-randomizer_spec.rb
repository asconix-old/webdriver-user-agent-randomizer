require 'rspec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'webdriver-user-agent-randomizer'
require 'selenium-webdriver'
require 'watir-webdriver'
require 'nokogiri'

describe "webdriver user agent randomizer" do
  after :each do
    @driver.quit if @driver
  end

  it "can create a new webdriver driver using Firefox and a random user agent" do
  	@driver = UserAgent.driver
  	@driver.browser.should == :firefox
  	@driver.execute_script('return navigator.userAgent').should_not be_nil
  end

  it "can create a new webdriver driver using Chrome and a random user agent" do
    @driver = UserAgent.driver(:browser => :chrome)
    @driver.browser.should == :chrome
    puts @driver.execute_script('return navigator.userAgent')
    @driver.execute_script('return navigator.userAgent').should_not be_nil
  end

  it "can create a new webdriver driver using an existing Firefox profile" do
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile['browser.startup.homepage'] = "data:text/html,<title>hello</title>"
    @driver = UserAgent.driver(:browser => :firefox, :profile => profile)
    @driver.browser.should == :firefox
    @driver.execute_script('return navigator.userAgent').should_not be_nil
    @driver.title.should == 'hello'
  end

  it "can allow using selenium driver for watir browser" do
    @driver = UserAgent.driver(:browser => :firefox)
    @browser = Watir::Browser.new @driver
    @browser.url.should == "about:blank" 
  end
end
