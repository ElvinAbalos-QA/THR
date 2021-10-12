*** Settings ***

Documentation     A test case for user is able to register
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.

Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

Login test case
    Sign Up with User

# Open MBC app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User
