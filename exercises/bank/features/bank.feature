Feature: Bank account
	Scenario: Deposit into new account
		Given a new account for Sam
		When Sam deposits 50
		Then Sam should have a balance of 50

	Scenario: Deposit into existing account
		Given a new account for Sam
		And Sam deposits 50
		When Sam deposits 100
		Then Sam should have a balance of 150

	Scenario: Withdraw from account
		Given a new account for Sam
		And Sam deposits 50
		When Sam withdraws 25
		Then Sam should have a balance of 25

	Scenario: Transfer between accounts
		Given a new account for Sam
		And a new account for Alex
		And Sam deposits 100
		When Sam transfers 25 to Alex
		Then Sam should have a balance of 75
		And Alex should have a balance of 25
