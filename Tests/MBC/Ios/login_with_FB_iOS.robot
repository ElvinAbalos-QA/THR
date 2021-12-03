*** Settings ***
Documentation     A test case for user is able to sign up and login with facebook
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application IOS
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***
Login with Facebook test case - IOS
    [Tags]    sanity
    Handle Location and Notification IOS
    Go To Facebook    //XCUIElementTypeStaticText[@name='OR REGISTER']    ${LOGIN_WITH_FACEBOOK_BUTTON_IOS}
    Handle Modals    //XCUIElementTypeAlert[@name='“mbcapp” Wants to Use “facebook.com” to Sign In']    //XCUIElementTypeButton[@name='Continue']
    Sleep    3
    Handle Modals   //XCUIElementTypeTextView[@name='Open in “Facebook”?']      //XCUIElementTypeButton[@name='Open']
    Sleep    3
    Handle Modals    //XCUIElementTypeStaticText[@name='You previously logged in to MBC with Facebook.']    //XCUIElementTypeButton[@name='Continue']
    comment    Sleep    3
    comment    Can't handle modals in ios
    #    Handle Modals       //XCUIElementTypeAlert[@name='You are currently logged in on another device']       //XCUIElementTypeButton[@name='USE HERE']
    Sleep    5
    Facebook Sign Up    //XCUIElementTypeStaticText[@name='SIGN UP VIA FACEBOOK']
    Sleep   5
    Tap The Skip Tutorial   ${SKIP_TUTORIAL_IOS}
    Swipe    5    173    176    178         # to view the sidenav
    Sleep    5
    Page Should Contain Element     ${LOGOUT_TAB_IOS}
    Tap The Element     ${LOGOUT_TAB_IOS}
    Page Should Contain Element     ${LOGIN_BUTTON_IOS}
