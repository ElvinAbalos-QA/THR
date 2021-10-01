*** Settings ***

Documentation     A test case for user is able to login
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../Resources/resources.robot
Resource          ../../../Resources/variables.robot

*** Test Cases ***

Login test case
    Open Myeasytrip Application
    Sign With User      ${USER_DETAILS}[email]     ${USER_DETAILS}[password]
    Submit Login Button
    Logout With User
#    Quit Application

Login negative test case
    Open Myeasytrip Application
    Sign With User      ${EMPTY_DETAILS}[email]     ${EMPTY_DETAILS}[password]
    Submit Login Button
    Handle Login Failed
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
