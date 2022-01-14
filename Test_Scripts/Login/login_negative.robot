*** Settings ***
Documentation     A test case for a THR admin can check validations for login
Resource          ../../Resources/resources.robot
Suite Setup     Open THR
Suite Teardown    Close Browser

*** Test Cases ***
Login wrong email and wrong password
    [Tags]      positive
    Input Field     ${EMAIL_FIELD}  ${USER_CREDENTIALS}[wrong_email]
    Input Field     ${PASSWORD_FIELD}   ${USER_CREDENTIALS}[wrong_password]
    Click       ${LOGIN_BUTTON}
    Get Url     ==  ${URL}[0]