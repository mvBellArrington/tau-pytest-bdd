Feature: Retirement Age Calculator
	A program that determines retirement age and date based on birth year and birth month

Scenario: Enter year I was born
	Given I am born between 1900 and today's year

	When I input my birth year
	And hit "Enter"

	Then an error message will not show of invalid year
	And program will ask for my birth month

Scenario: Enter month I was born
	Given there are 12 months in a year

	When I input my birth month by number
	And not enter birth month by name

	Then program will show retirement age in years and months

Scenario: Determine retirement age
	Given the birth month and birth year entered are valid

	When I enter 10 for the month
	And 1989 for the year

	Then the retirement age should be 71 years as of year 2021
	And the remaining months of the retirement age should be 10 months

Scenario: Determine month and year of retirement
	Given the birth month and birth year entered are valid

	When I enter 10 for month
	And 1989 for the year

	Then the month of retirement should be August as of November 11, 2021
	And the year of retirement should be 2061 as of November 11, 2021

Scenario: Exiting program
	Given the program tells me how to exit the loop
	And the input is not case-sensitive

	When I type in the keys

	Then I will be prompted that the program has exited
	And program finishes with successful exit code

