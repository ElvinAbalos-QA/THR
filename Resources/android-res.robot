*** Settings ***
Library     AppiumLibrary
Resource    password.robot

*** Variables ***

#*** Test variables ***
&{USER1-DETAILS}               email=testing@mailinator.com     password=${PASSWORD}
&{USER2-DETAILS}               email=testing2@mailinator.com    password=${PASSWORD}

#*** Android 10 variables ***
${ANDROID10-CONTINUE-BUTTON}          id=com.android.permissioncontroller:id/continue_button
${ANDROID10-OK-BUTTON}                //android.widget.Button[@text="OK"]
${ANDROID10-NO-THANKS-BUTTON}         //android:id/autofill_save_no

#*** Application Variables ***
${CHAT21-APPLICATION-ID}              chat21.android.demo
${CHAT21-APPLICATION-ACTIVITY}        chat21.android.demo.SplashActivity

#*** Login Page ***
${LOGIN-EMAIL-FIELD}            id=${CHAT21-APPLICATION-ID}:id/email
${LOGIN-PASSWORD-FIELD}         id=${CHAT21-APPLICATION-ID}:id/password
${LOGIN-SIGNIN-BUTTON}          id=${CHAT21-APPLICATION-ID}:id/login

#*** Main Page ***
${MAIN-HOME-TAB}                //android.widget.TextView[@text="HOME"]
${MAIN-PROFILE-TAB}             //android.widget.TextView[@text="PROFILE"]

#*** Profile Page ***
${PROFILE-LOGOUT-BUTTON}        //android.widget.Button[@text="LOGOUT"]

*** Keywords ***

Wait For 5 Seconds
    Sleep    5s

Bypass Android 10 Alerts
    Wait Until Page Contains Element        ${ANDROID10-CONTINUE-BUTTON}
    Click Element                           ${ANDROID10-CONTINUE-BUTTON}
    Wait Until Page Contains Element        ${ANDROID10-OK-BUTTON}
    Click Element                           ${ANDROID10-OK-BUTTON}
    Wait For 5 Seconds
#    Wait Until Page Contains Element        ${ANDROID10-NO-THANKS-BUTTON}
#    Click Element                           ${ANDROID10-NO-THANKS-BUTTON}

Open Chat21 Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=Pixel_4_Edited_API_29    appPackage=${CHAT21-APPLICATION-ID}      appActivity=${CHAT21-APPLICATION-ACTIVITY}      automationName=Uiautomator2
    ${ALERT}        Run Keyword And Return Status       Page Should Not Contain Element     ${ANDROID10-CONTINUE-BUTTON}
    Run Keyword If    '${ALERT}' == 'False'      Bypass Android 10 Alerts

Sign with User
    [Arguments]     ${EMAIL}     ${USERPASSWORD}
    Input User Email        ${EMAIL}
    Input User Password     ${USERPASSWORD}

Input User Email
    [Arguments]     ${EMAIL}
    Verify Login Email Field Displayed
    Input Text        ${LOGIN-EMAIL-FIELD}        ${EMAIL}

Input User Password
    [Arguments]     ${USERPASSWORD}
    Input Text        ${LOGIN-PASSWORD-FIELD}     ${USERPASSWORD}

Submit login button
    Click Element     ${LOGIN-SIGNIN-BUTTON}

Verify Login Is Successful
    Wait Until Page Contains Element              ${MAIN-HOME-TAB}

Logout with User
    Go To Profile Page
    Click The Logout Button
    Verify Login Email Field Displayed

Go To Profile Page
    Click Element                                 ${MAIN-PROFILE-TAB}
    Wait Until Page Contains Element              ${PROFILE-LOGOUT-BUTTON}

Click The Logout Button
    Click Element                                 ${PROFILE-LOGOUT-BUTTON}

Verify Login Email Field Displayed
    Wait Until Page Contains Element              ${LOGIN-EMAIL-FIELD}