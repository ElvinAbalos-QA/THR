*** Settings ***
Library    AppiumLibrary

*** Variables ***
${LOGIN_SUBMIT_BUTTON1}     id=chat21.android.demo:id/login


*** Test Cases ***
Open_Application
#    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.mbcapp      appActivity=com.mbcapp.MainActivity      automationName=Uiautomator2
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=chat21.android.demo      appActivity=chat21.android.demo.SplashActivity      automationName=Uiautomator2
    Wait Until Page Contains Element            ${LOGIN_SUBMIT_BUTTON1}
    Tap    ${LOGIN_SUBMIT_BUTTON1}
#    Close Application


*** Keywords ***
