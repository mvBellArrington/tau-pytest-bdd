@retirement
Feature: Retirement Age Calculator
	A program that determines retirement age and date based on birth year and birth month.

	@calculate_retirement_age
	Scenario: Determine valid year input
		Given Birth year should be between 1900 and 2021 inclusively
		When I input 1893
		Then a ValueError will be thrown

	@calculate_retirement_date
	Scenario: Determine valid month input
		Given The birth year is valid
		And the birth month should be a numerical value
		And the retirement age is calculated and inputted
		When the birth month is 0
		Then a ValueError is thrown


	@calculate_retirement_age
	Scenario Outline: Calculate retirement age
		Given the "<birth_month>" and "<birth_year>" entered are valid
		When I enter "<birth_month>" for the month
		And I enter "<birth_year>" for the year
		Then the retirement age should be "<retirement_age>" years as of year 2021
		And the remaining months of the retirement age should be "<remaining_months>" months
		Examples:
			| birth_year | retirement_age | remaining_months
			| 1900       | 65	          | 0
			| 1938       | 65             | 2
			| 1940       | 65             | 6
			| 1954       | 66             | 0
			| 1955       | 66             | 2
			| 1957       | 66             | 6
			| 1959       | 66             | 10
			| 1960       | 67             | 0
			| 2010       | 67             | 0

	@calculate_retirement_date
	Scenario Outline: Calculate month and year of retirement
		Given the valid birth month is "<birth_month>"
		And the valid birth year is "<birth_year>"
		And  the retirement age is "<retirement_age>" and "<remaining_months>"
		When I calculate the retirement date
		Then the month of retirement should be "<month>" as of 2021
		And the year of retirement should be "<year>" as of 11/18/2021
		Examples:
			| birth_month | birth_year | retirement_age | remaining_months | month | year
			| 1           | 1900       | 65	            | 0 			   | 1	   | 1965
			| 2           | 1938       | 65             | 2 	     	   | 4 	   | 2003
			| 3           | 1940       | 65             | 6           	   | 9 	   | 2005
			| 4           | 1954       | 66             | 0	               | 4 	   | 2020
			| 5           | 1955       | 66             | 2                | 7     | 2021
			| 6           | 1957       | 66             | 6                | 12    | 2023
			| 7           | 1959       | 66             | 10               | 5     | 2026
			| 8           | 1960       | 67             | 0                | 8     | 2027
			| 9           | 2010       | 67             | 0                | 9     | 2077



