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

Negative Test Case
    [Documentation]     This is to be able to check a negative test case for email already taken
    [Tags]      negative    email_already_exist
    Sign Up with User
    Handle Register    ${USER_DETAILS}[email]

Positive Test Case
    [Documentation]     This is to be able to check a positive test case for email already taken
    [Tags]      positive    sanity
    Sign Up with User
    Handle Register    bliimocheck3@mailinator.com