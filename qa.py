from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.chrome.options import Options

def GetNetworkResources(driver):
    Resources = driver.execute_script("return window.performance.getEntries();")
    for resource in Resources:
        if resource['name'][0:40] == 'https://www.google-analytics.com/collect':
            print(resource['name'])
    return Resources

caps = DesiredCapabilities.CHROME
caps['loggingPrefs'] = {'performance': 'ALL'}
options = webdriver.ChromeOptions()
options.add_argument("--user-data-dir=/Users/imakovoz/Library/Application Support/Google/Chrome/Profile 2")
driver = webdriver.Chrome(desired_capabilities=caps, options=options)

driver.get('https://calero.com')

GetNetworkResources(driver)

driver.close()
