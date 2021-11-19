*** Settings ***
Documentation     A test case for a user is able to view My Papremyo list screen
Resource          ../../../Resources/resources.robot
Suite Setup     Open MBC Application IOS
Test Setup      Launch Application
Test Teardown    Quit Application
Suite Teardown    Close Application

*** Test Cases ***
Notification test case IOS
    [Tags]    sanity       positive
    Handle Location and Notification IOS
    Go To Login Screen      ${LOGIN_BUTTON_IOS}
    Sign With User      ${USER_DETAILS}[email]     ${LOGIN_EMAIL_FIELD_IOS}       ${USER_DETAILS}[password]       ${LOGIN_PASSWORD_FIELD_IOS}
    Handle Hide Keyboard
    Submit Login Button     ${LOGIN_BUTTON_IOS}
    Handle Modals       ${MODAL_LOGGED_IN_ANOTHER_DEVICE_IOS}       ${USE_HERE_BUTTON_IOS}
    Sleep    3
    ${PASSED}=      Run Keyword And Return Status       Wait Until Page Contains Element        ${VERIFICATION_MODAL_IOS}
    Run Keyword If       '${PASSED}' == 'True'      Handle Verification
    Wait Until Page Contains Element        ${SKIP_TUTORIAL_IOS}
    Tap The Element     ${SKIP_TUTORIAL_IOS}
    Sleep    3
    Swipe    5    173    176    178         # to view the sidenav
    Swipe    205    1122    207    553      # swipe to view notification
    Sleep    3
    Tap The Element    ${NOTIFICATION_IOS}
    Page Should Contain Text    Notifications
    Tap The Element    ${TOGGLE_IOS}
    Page Should Contain Text    Alert
    Handle Modals       //XCUIElementTypeStaticText[@name="Notification turn off."]       //XCUIElementTypeButton[@name="OK"]
    Tap The Element    ${TOGGLE_IOS}
    Page Should Contain Text    Alert
    Handle Modals       //XCUIElementTypeStaticText[@name="Notification turn on."]       //XCUIElementTypeButton[@name="OK"]
    Swipe    5    173    176    178         # to view the sidenav
    Sleep    3
    Page Should Contain Element     ${LOGOUT_TAB_IOS}
    Tap The Element     ${LOGOUT_TAB_IOS}
    Page Should Contain Element     ${LOGIN_BUTTON_IOS}