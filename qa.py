from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

caps = DesiredCapabilities.CHROME
caps['loggingPrefs'] = {'performance': 'ALL'}
driver = webdriver.Chrome(desired_capabilities=caps)

driver.get('https://calero.com')

for entry in driver.get_log('performance'):
    print (entry)
    print ('************')

driver.close()
