*** Settings ***

Documentation     A test case for user is able to check balance
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../Resources/resources.robot
Resource          ../../../Resources/variables.robot

*** Test Cases ***

Quick Balance test case
    Open Myeasytrip Application
    Check Quick Balance

# Open MBC app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User