*** Settings ***
Documentation     A test case for a THR admin can use the forgot password functionality
Resource          ../../Resources/resources.robot
Suite Setup     Open THR
Suite Teardown    Close Browser

*** Test Cases ***
Forgot Password Functionality - Email Not Found
    [Tags]      negative
    Click     //a[contains(text(),'Forgot your password?')]
    Input Field     \#admin_user_email  ${USER_CREDENTIALS}[wrong_email]
    Click     \#admin_user_submit_action > input[type=submit]
    Wait For Elements State     //p[contains(text(),'not found')]



