@retirement
Feature: Retirement Age Calculator
	A program that determines retirement age and date based on birth year and birth month.

	@input
	Scenario Outline: Enter year I was born
		Given I am born between 1900 and 2021 year
		When I input my "<birth_year>"
		And hit Enter
		Then an error message will not show of invalid year
		Examples:
			| birth_year | error
			| 1900		 | false
			| 1989   	 | false
			| 2021		 | false
			| 1893		 | true
			| 2022		 | true

	@input
	Scenario Outline: Enter month I was born
		Given there are 12 months in a year
		And "<birth_year>" is valid
		When I input my "<birth_month>" by numerical month
		And not enter "<birth_month>" by name
		Then program will show retirement age in "<year_of_retirement>" and "<month_of_retirement>" as of 2021
		Examples:
			| birth_year | birth_month | year_of_retirement | month_of_retirement
			| 2000	     | 10		   | 2074 	            | June
			| 2000		 | -1          | ValueError      	| ValueError
			| 2000	     | 13          | ValueError    		| ValueError
			| 2000       | october	   | TypeError			| TypeError

	@calculate
	Scenario Outline: Determine retirement age
		Given the "<birth_month>" and "<birth_year>" entered are valid
		When I enter "<birth_month>" for the month
		And I enter "<birth_year>" for the year
		Then the retirement age should be "<retirement_age>" years as of year 2021
		And the remaining months of the retirement age should be "<remaining_months>" months
		Examples:
			| birth_month | birth_year | retirement_age | remaining_months
			| 10          | 1901       | 59	            | 0
			| 10          | 1937       | 65             | 0
			| 10          | 1940       | 65             | 0
			| 10          | 1954       | 66             | 0
			| 10          | 1955       | 66             | 2
			| 10          | 1957       | 66             | 6
			| 10          | 1959       | 66             | 10
			| 10          | 1960       | 67             | 0
			| 10          | 2010       | 75             | 4


	@calculate
	Scenario Outline: Determine month and year of retirement
		Given the "<birth_month>" and "<birth_year>" entered are valid
		When I enter "<birth_month>" for the month
		And I enter "<birth_year>" for the year
		Then the month of retirement should be "<month_name>" as of 2021
		And the year of retirement should be "<retirement_year>" as of 11/18/2021
		Examples:
			| birth_month | birth_year | month_name | retirement_year
			| 10          | 1989       | August     | 2061

	@end
	Scenario: Exiting program
		Given the program tells me how to exit the loop
		And the input is not case-sensitive
		When I type in the required keys
		Then I will be prompted that the program has exited
		And program finishes with successful exit code

