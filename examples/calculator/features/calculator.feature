Feature: Using the calculator
	Scenario: Add two numbers
		Given the numbers "2" and "2"
		When I add them in the calculator
		Then the output should be "4"

	Scenario: Subtract two numbers
		Given the numbers "4" and "2"
		When I subtract them in the calculator
		Then the output should be "2"
