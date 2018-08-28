from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

def GetNetworkResources(driver):
    Resources = driver.execute_script("return window.performance.getEntries();")
    for resource in Resources:
        print(resource['name'])
    return Resources

caps = DesiredCapabilities.CHROME
caps['loggingPrefs'] = {'performance': 'ALL'}
driver = webdriver.Chrome(desired_capabilities=caps)

driver.get('https://calero.com')

GetNetworkResources(driver)

# for entry in driver.get_log('performance'):
#     print (entry)
#     print ('************')

driver.close()
