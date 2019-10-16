import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class BasePage:

	def __init__(self, browser, url):
		print("Starting up %s browser" % (browser,))
		self.driver = webdriver.Chrome() if browser == "Chrome" else webdriver.Firefox()
		self.driver.get(url)
		self.driver.maximize_window()

	def tearDown(self):
		print("Killing browser...")
		self.driver.close()
		print("Browser was killed")

class Ecommerse(BasePage):

	def __init__(self, browser, url):
		super().__init__(browser, url)

	def verifyHeader(self, locator, match):
		assert self.driver.find_element_by_xpath(locator).text == match

	def search(self, query, match):
		elem = self.driver.find_element_by_id("woocommerce-product-search-field-0")
		elem.clear()
		elem.send_keys(query)
		elem.send_keys(Keys.RETURN)
		assert match not in self.driver.page_source

if __name__ == "__main__":
	app_url = os.environ['APP_URL']
	browser = os.environ['BROWSER']
	e1 = Ecommerse(browser, app_url)
	e1.verifyHeader('//*/h1','Welcome')
	e1.search('','Search Results for:')
	e1.search('hoodie','Search results: "hoodie"')
	e1.search('hoodies','Nothing Found')
	e1.tearDown()
	del e1
