Feature: Wikipedia Web Browsing
  As a web surfer,
  I want to find information online,
  So I can learn new things.


  Background:
    Given the Wikipedia home page is displayed

  Scenario: Checking which web driver is used
    When I pull up the name of the web driver
    Then The driver name is chrome

  Scenario: Checking which home page is open
    When I check the title of the current home page
    Then The title is Wikipedia

  Scenario: Search for 'wake tech' in Wikipedia
    When I find the element for searchInput
    Then The search field should have 'wake tech' as input

  Scenario: Pulling up Wake Tech Wikipedia Page
    When I search for element firstHeading
    Then The website will redirect me to the Wake Technical Community College
