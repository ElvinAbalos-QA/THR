*** Settings ***
Documentation     A test case for user is able to login with facebook
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***
Login with Facebook test case
    [Tags]    sanity
    Facebook Sign Up
