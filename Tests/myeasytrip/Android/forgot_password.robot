*** Settings ***
Documentation     A test case for the user is able to forgot password
Resource          ../../../Resources/resources.robot
Suite Setup     Open Myeasytrip Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

Forgot password test case
    [Tags]    sanity
    Forgot Password

Check the email in mailinator
     Open Mailinator
     Input Field     //*[@id="addOverlay"]       testadonis
     Click    text=GO