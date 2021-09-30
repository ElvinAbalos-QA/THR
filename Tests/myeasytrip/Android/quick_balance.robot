*** Settings ***

Documentation     A test case for user should be able to check the balance
Resource          ../../../Resources/resources.robot
Suite Setup     Open Myeasytrip Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

User should be able to check the balance
    [Tags]    smoke
    Tap The Element    ${QUICK_BALANCE_BUTTON}
    Input Account Number

#    Click Element
# Open myeasytrip app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User
