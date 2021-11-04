*** Settings ***
Documentation     A test case for user is able to sign up and login with gmail
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***
Login with Gmail test case
    [Tags]    sanity
    Gmail Sign Up
