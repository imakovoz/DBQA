require 'rubygems'
require 'selenium-webdriver'
require 'browsermob/proxy'
require 'har'
require 'byebug'



DesiredCapabilities caps = DesiredCapabilities.chrome();
LoggingPreferences logPrefs = new LoggingPreferences();
logPrefs.enable(LogType.PERFORMANCE, Level.INFO);
caps.setCapability(CapabilityType.LOGGING_PREFS, logPrefs);

WebDriver driver=new RemoteWebDriver(new URL("http://localhost:4444/wd/hub"), caps);

driver.get("http://codoid.com/about-codoid/");

List<LogEntry> entries = driver.manage().logs().get(LogType.PERFORMANCE).getAll();
System.out.println(entries.size() + " " + LogType.PERFORMANCE + " log entries found");
for (LogEntry entry : entries) {
    System.out.println(
            new Date(entry.getTimestamp()) + " " + entry.getLevel() + " " + entry.getMessage());
}

driver.close();

driver.quit();














# server = BrowserMob::Proxy::Server.new('/Users/imakovoz/Downloads/browsermob-proxy-2.1.4/bin/browsermob-proxy') #=> #<BrowserMob::Proxy::Server:0x000001022c6ea8 ...>
# server.start
#
# proxy = server.create_proxy #=> #<BrowserMob::Proxy::Client:0x0000010224bdc0 ...>
#
# profile = Selenium::WebDriver::Firefox::Profile.new #=> #<Selenium::WebDriver::Firefox::Profile:0x000001022bf748 ...>
# profile.proxy = proxy.selenium_proxy
#
# driver = Selenium::WebDriver.for :firefox, :profile => profile
#
# proxy.new_har "google"
# driver.get "http://calero.com"
#
# har123 = proxy.har #=> #<HAR::Archive:0x-27066c42d7e75fa6>
# har123.entries.first.request.url #=> "http://google.com"
# har123.save_to "/Users/imakovoz/Downloads/google.har"
# puts har123
# debugger
#
# proxy.close
# driver.quit
