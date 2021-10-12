*** Settings ***

Documentation     A test case for a user is able to log in and check the validation messages
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***

Login negative valid email and wrong password test case
    [Documentation]     This is to be able to check a negative test case for a valid email and wrong password fields.
    [Tags]      negative    invalid_credentials
    Go To Login Screen
    Sign With User      ${USER_DETAILS}[email]     ${USER_DETAILS}[wrong_password]
    Submit Login Button
    Handle Login Failed     ${LOGIN_FAILED_INVALID_CREDENTIALS}

Login negative wrong email and valid password test case
    [Documentation]     This is to be able to check a negative test case for a wrong email and valid password fields.
    [Tags]      negative    invalid_credentials
    Go To Login Screen
    Sign With User      ${USER_DETAILS}[wrong_email]     ${USER_DETAILS}[password]
    Submit Login Button
    Handle Login Failed     ${LOGIN_FAILED_INVALID_CREDENTIALS}

Login positive test case
    [Tags]    sanity
    Go To Login Screen
    Sign With User      ${USER_DETAILS}[email]     ${USER_DETAILS}[password]
    Submit Login Button
    Handle Modals       ${MODAL_LOGGED_IN_ANOTHER_DEVICE}       ${USE_HERE_BUTTON}
    ${PASSED}=      Run Keyword And Return Status       Wait Until Page Contains Element        ${VERIFICATION_MODAL}
    Run Keyword If       '${PASSED}' == 'True'      Handle Verification
#    Wait Until Page Contains Element        ${SKIP_TUTORIAL}
#    Tap The Element     ${SKIP_TUTORIAL}
    Game Tutorial
    Logout with User

# Open MBC app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User
