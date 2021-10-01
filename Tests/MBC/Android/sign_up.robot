*** Settings ***

Documentation     A test case for user is able to login
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../Resources/resources.robot

*** Test Cases ***

Login test case
    Open Myeasytrip Application
    Sign Up with User

# Open MBC app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User
