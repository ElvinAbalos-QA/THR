*** Settings ***
Documentation     A test case for the user is able to forgot password
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

Forgot password test case
    [Tags]    sanity
    Go To Login Screen
    Forgot Password

#Check the email in mailinator
#     Open Mailinator
#     Input Field     //*[@id="addOverlay"]       bliimocheck
#     Click    text=GO
#     Sleep      5