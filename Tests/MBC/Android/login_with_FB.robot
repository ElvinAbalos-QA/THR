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
    Sleep   5
    Wait Until Page Contains Element        //android.widget.TextView[@text='OR REGISTER']
    Wait Until Page Contains Element    ${LOGIN_WITH_FACEBOOK_BUTTON}
    Run Keyword Until Success    Click Element    ${LOGIN_WITH_FACEBOOK_BUTTON}
    Sleep       10
    Handle Modals       ${MODAL_LOGGED_IN_ANOTHER_DEVICE}       ${USE_HERE_BUTTON}

#    Wait Until Page Contains Element        ${SKIP_TUTORIAL}
#    Tap The Element     ${SKIP_TUTORIAL}
#    ${PASSED}=      Run Keyword And Return Status       Wait Until Page Contains Element        //android.widget.TextView[@text='SIGN UP VIA FACEBOOK']
#    Run Keyword If       '${PASSED}' == 'True'      Handle Sign Up Via Facebook
#    Logout With User

# Open MBC app
# Sign With User
    # Input Email
    # Input Password
    # Submit button
    # Verify If Login Successful
# Logout With User