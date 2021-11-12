*** Settings ***
Documentation     A test case for user is able to sign up and login with facebook
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***
Login with Facebook test case
    [Tags]    sanity
    Go To Facebook    //android.widget.TextView[@text='OR REGISTER']    ${LOGIN_WITH_FACEBOOK_BUTTON}
    Handle Modals       ${MODAL_LOGGED_IN_ANOTHER_DEVICE}       ${USE_HERE_BUTTON}
    Facebook Sign Up    //android.widget.TextView[@text='SIGN UP VIA FACEBOOK']
    Tap The Skip Tutorial    ${SKIP_TUTORIAL}
    Sleep    3
    Capture Page Screenshot
