"""
This module contains step definitions for web.feature.
It uses Selenium WebDriver for browser interactions:
https://www.seleniumhq.org/projects/webdriver/
Setup and cleanup are handled using hooks.
For a real test automation project,
use Page Object Model or Screenplay Pattern to model web interactions.

Prerequisites:
 - Chrome must be installed.
 - chromium must be installed and accessible on the system path.
"""

import pytest

from pytest_bdd import scenarios, given, when, then, parsers
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from time import sleep


# Constants

WIKIPEDIA = 'https://www.wikipedia.org/'


# Scenarios

@scenarios('../features/lab12.feature')

def test_wiki():
    pass

# Fixtures

@pytest.fixture
def browser():
    b = webdriver.Chrome()
    b.implicitly_wait(10)
    yield b
    b.quit()

@given('the Wikipedia home page is displayed', target_fixture='open_wiki')
def open_wiki():
    browser.get(WIKIPEDIA)

@when('I pull up the name of the web driver')
def get_driver_name(browser):
    name = browser.name

@then('The driver name is <driver>')
def is_chrome_driver(browser, driver):
    assert get_driver_name.name == driver


@when('I check the title of the current home page')
def get_page_title(browser):
    title = browser.title
@then('The title is <page>')
def is_wiki(browser, page):
    assert get_page_title.title == page

@when('I find the element for <input>')
def find_element(browser, input):
    searchField = browser.find_element(By.ID, input)
    searchField.clear()
@then('The search field should have <search_field> as input')
def search_wake_tech(browser, search_field):
    find_element.searchField.send_keys(search_field)
    current_search_field = find_element.searchField.get_attribute("value")
    assert current_search_field == search_field

@when('I search for element <wtcc>')
def results(browser, wtcc):
    site_title = driver.find_element(By.ID, wtcc).text
@then('The website will redirect me to the <content>')
def content_page(browser, content):
    assert result.site_title == content


