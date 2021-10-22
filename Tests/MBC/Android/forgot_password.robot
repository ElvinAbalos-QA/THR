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
    Go To Login Screen      ${LOGIN_BUTTON}
    Forgot Password
    Sleep    5
    Log To Console    'Successfully :)'

#Check the email in mailinator
#    Open Mailinator
#    Input Field     //*[@id="addOverlay"]       ${USER_DETAILS}[email]
#    Wait For Elements State     text='GO'
#    Click  "GO"
#    Wait For Elements State         text="just now"
#    Click   xpath=/html/body/div/main/div[2]/div[3]/div/div[4]/div/div/table/tbody/tr[1]/td[3]
#    Sleep    5
#    ${text} =    Browser.Get Text    xpath=/html/body/b
#    Sleep    5
#    Log To Console    'Successfully :)'
#    Log To Console    ${text}
