import time

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# Constants
email = "~REDACTED~"
password = "~REDACTED~"

driver = webdriver.Chrome()
login_page = "~REDACTED~"

with open('pages.txt') as fp:
    pages = fp.readlines()

driver.get(login_page)
elem = driver.find_element_by_css_selector('input[id="user_email"]')
elem.send_keys(email)
elem = driver.find_element_by_css_selector('input[id="user_password"]')
elem.send_keys(password)
elem.send_keys(Keys.RETURN)
time.sleep(5)

sources = []
for page in pages:
    driver.get(page)
    elem = driver.find_element_by_css_selector('source')
    sources.append(elem.get_property('src'))

for src in sources:
    print(src)
