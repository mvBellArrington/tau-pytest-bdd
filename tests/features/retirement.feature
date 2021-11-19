@retirement
Feature: Retirement Age Calculator
	A program that determines retirement age and date based on birth year and birth month.

	@input
	Scenario Outline: Enter "<year>" I was born
		Given I am born between 1900 and "<today>" year
		When I input my "<birth year>"
		And hit Enter
		Then an error message will not show of invalid year
		And program will ask for my "<birth month>"
		Examples:

	@input
	Scenario Outline: Enter "<month>" I was born
		Given there are 12 months in a year
		When I input my "<birth month>" by "<data type: Number>"
		And not enter "<birth month>" by "<data type: String>"
		Then program will show retirement "<age>" in "<years>" and "<months>"
		Examples:

	@calculate
	Scenario Outline: Determine retirement age
		Given the "<birth month>" and "<birth year>" entered are valid
		When I enter "<birth month>" for the month
		And I enter "<birth year>" for the year
		Then the retirement age should be "<retirement age>" years as of year "<this year>"
		And the remaining months of the retirement age should be "<remaining months>" months
		Examples:

	@calculate
	Scenario Outline: Determine month and year of retirement
		Given the "<birth month>" and "<birth year>" entered are valid
		When I enter "<birth month>" for the month
		And I enter "<birth year>" for the year
		Then the month of retirement should be "<month name>" as of "<this date>"
		And the year of retirement should be "<retirement year>" as of "<this date>"
		Examples:

	@end
	Scenario: Exiting program
		Given the program tells me how to exit the loop
		And the input is not case-sensitive
		When I type in the required keys
		Then I will be prompted that the program has exited
		And program finishes with successful exit code

