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


# Fixtures

@pytest.fixture
def browser():
    driver = webdriver.Chrome()


# Given Steps

@given('the Wikipedia home page is displayed', target_fixture='wiki_home')
def wiki_home(browser):
    browser.get(WIKIPEDIA)


# When Steps

@when(parsers.parse('the user searches for {text}'))
@when(parsers.parse('the user searches for the phrase:\n{text}'))
def search_phrase(browser, text):
    search_input = browser.find_element_by_name('q')
    search_input.send_keys(text + Keys.RETURN)


# Then Steps

@then(parsers.parse('one of the results contains {phrase}'))
def results_have_one(browser, phrase):
    xpath = "//div[@id='links']//*[contains(text(), '%s')]" % phrase
    results = browser.find_elements_by_xpath(xpath)
    assert len(results) > 0


@then(parsers.parse('results are shown for {phrase}'))
def search_results(browser, phrase):
    # Check search result list
    # (A more comprehensive test would check results for matching phrases)
    # (Check the list before the search phrase for correct implicit waiting)
    links_div = browser.find_element_by_id('links')
    assert len(links_div.find_elements_by_xpath('//div')) > 0
    # Check search phrase
    search_input = browser.find_element_by_name('q')
    assert search_input.get_attribute('value') == phrase