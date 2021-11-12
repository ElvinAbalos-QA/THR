*** Settings ***

Documentation     A test case for a user is able to log in and check the validation messages
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application IOS
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

Login negative valid email and wrong password test case
    [Documentation]     This is to be able to check a negative test case for a valid email and wrong password fields.
    [Tags]      negative    invalid_credentials
    Handle Location and Notification IOS
    Go To Login Screen      ${LOGIN_BUTTON_IOS}
    Sign With User      ${USER_DETAILS}[email]     ${LOGIN_EMAIL_FIELD_IOS}     ${USER_DETAILS}[wrong_password]     ${LOGIN_PASSWORD_FIELD_IOS}
    Submit Login Button     ${LOGIN_BUTTON_IOS}
    Handle Hide Keyboard
#    Handle Login Failed     ${LOGIN_FAILED_INVALID_CREDENTIALS}    ${LOGIN_FAILED}     ${OK_BUTTON}

Login negative wrong email and valid password test case
    [Documentation]     This is to be able to check a negative test case for a wrong email and valid password fields.
    [Tags]      negative    invalid_credentials
    Handle Location and Notification IOS
    Go To Login Screen      ${LOGIN_BUTTON_IOS}
    Sign With User      ${USER_DETAILS}[wrong_email]     ${LOGIN_EMAIL_FIELD_IOS}       ${USER_DETAILS}[password]       ${LOGIN_PASSWORD_FIELD_IOS}
    Submit Login Button     ${LOGIN_BUTTON_IOS}
    Handle Hide Keyboard
#    Handle Login Failed     ${LOGIN_FAILED_INVALID_CREDENTIALS}     ${LOGIN_FAILED}     ${OK_BUTTON}

Login positive test case
    [Tags]    sanity       positive
    Handle Location and Notification IOS
    Go To Login Screen      ${LOGIN_BUTTON_IOS}
    Sign With User      ${USER_DETAILS}[email]     ${LOGIN_EMAIL_FIELD_IOS}       ${USER_DETAILS}[password]       ${LOGIN_PASSWORD_FIELD_IOS}
    Handle Hide Keyboard
    Submit Login Button     ${LOGIN_BUTTON_IOS}
    Handle Modals       ${MODAL_LOGGED_IN_ANOTHER_DEVICE_IOS}       ${USE_HERE_BUTTON_IOS}
    Sleep    3
    Log To Console    'Done'
    ${PASSED}=      Run Keyword And Return Status       Wait Until Page Contains Element        ${VERIFICATION_MODAL_IOS}
    Run Keyword If       '${PASSED}' == 'True'      Handle Verification
    Game Tutorial   ${FINISH_TUTORIAL_BUTTON_IOS}      # FINISH TUTORIAL BUTTON
    Click The Logout Button     ${LOGOUT_TAB_IOS}