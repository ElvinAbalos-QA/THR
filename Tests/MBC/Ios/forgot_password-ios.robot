*** Settings ***

Documentation     A test case for user is able to forgot password
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../../../Resources/resources.robot
#Suite Setup     Open Myeasytrip Application IOS
#Test Setup      Launch Application
#Test Teardown    Quit Application
#Suite Teardown    Close Application

*** Test Cases ***

Forgot password test case
    Open Myeasytrip Application IOS
#    Forgot Password IOS

#Check the email in mailinator
#    Open Mailinator
#    Input Field     //*[@id="addOverlay"]       testadonis
#    Click    text=GO