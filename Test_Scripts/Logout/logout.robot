*** Settings ***
Documentation     A test case for a THR admin can logout
Resource          ../../Resources/resources.robot
Suite Setup     Open THR
Suite Teardown    Close Browser

*** Test Cases ***
Logout admin
    [Tags]      positive
    Input Field     ${EMAIL_FIELD}  ${USER_CREDENTIALS}[email]
    Input Field     ${PASSWORD_FIELD}   ${USER_CREDENTIALS}[password]
    Login Successfully
    Logout Admin    ${LOGOUT_BUTTON}