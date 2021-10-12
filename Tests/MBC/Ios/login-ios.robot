*** Settings ***

Documentation     A test case for a user is able to log in and check the validation messages
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application IOS
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

Login positive test case
    [Tags]    sanity
    Sleep    3
    Submit Login Button
    Sign With User      ${USER_DETAILS}[email]     ${USER_DETAILS}[password]
    Submit Login Button

#Login negative test case
#    Open Myeasytrip Application
#    Sign With User      ${EMPTY_DETAILS}[email]     ${EMPTY_DETAILS}[password]
#    Submit Login Button
#    Handle Login Failed
    # Add more negative test case here
#    Quit Application

#    Get Element Location       ${PROFILE_ICON}
#    Wait Activity
#    Click A Point       x=152, y=1065
#    Verify Login Is Successful
#    Logout With User

#    Reloading Partners
#    Logout
#    Close Application


# Open MBC app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User
