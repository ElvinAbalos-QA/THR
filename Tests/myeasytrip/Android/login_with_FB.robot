*** Settings ***

Documentation     A test case for user is able to login with facebook
Resource          ../../../Resources/resources.robot
Suite Setup     Open Myeasytrip Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

Login with Facebook test case
    [Tags]    sanity
    Wait Until Page Contains Element    ${LOGIN_WITH_FACEBOOK_BUTTON}
    Run Keyword Until Success    Click Element    ${LOGIN_WITH_FACEBOOK_BUTTON}
    Logout With User

# Open myeasytrip app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User
