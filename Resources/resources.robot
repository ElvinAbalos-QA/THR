*** Settings ***
Documentation    This is the resources file keywords
Library     AppiumLibrary
Library     Browser

*** Variables ***

#*** Test variables ***
&{USER_DETAILS}               email=eabalos40@yahoo.com     wrong_email=adonisyes@mailinator.com    password=Password@123   wrong_password=wrongpassword
&{USER_DETAILS_2}               email=bliimo@mailinator.com    password=Password@123


# *** Login Failed ***
${LOGIN_FAILED}                 //android.widget.TextView[@text='Login Failed']
${OK_BUTTON}                    //android.widget.TextView[@text='Ok']
${LOGIN_FAILED_EMPTY}      //android.widget.TextView[@text='Fields should not be empty. Please note that your myeasytrip app username and password is different from myeastrip web. Please try again.']
${LOGIN_FAILED_INVALID_CREDENTIALS}      //android.widget.TextView[@text='Invalid credentials. Please note that your myeasytrip app username and password is different from myeastrip web. Please try again.']



#*** APPLICATION Variables ***
${MYEASYTRIP-APPLICATION-ID}              com.easytripapp
${MYEASYTRIP-APPLICATION-ACTIVITY}        ${MYEASYTRIP-APPLICATION-ID}.MainActivity

#*** Login Page ***
${LOGIN_EMAIL_FIELD}            //android.widget.EditText[@text='Email']
${LOGIN_PASSWORD_FIELD}         //android.widget.EditText[@text='']
${LOGIN_SIGNIN_BUTTON}          //android.widget.TextView[@text='Login']
#${LOGIN_WITH_FACEBOOK_BUTTON}       //android.view.ViewGroup[@index=6]
${LOGIN_WITH_FACEBOOK_BUTTON}       //android.widget.TextView[@text='Login with Facebook']


#*** Dashboard Page ***
${PROFILE_ICON}                 //android.view.ViewGroup[@index=2]//android.widget.ImageView[@index=0]

#*** Quick Balance ***
${ACCOUNT_NUMBER_FIELD}         //android.view.ViewGroup//android.widget.EditText[@index=0]
${ACCOUNT_NUMBER}               520010187228
${QUICK_BALANCE_BUTTON}         //android.view.ViewGroup[@index=7]
${CHECK_BALANCE_BUTTON}         //android.widget.TextView[@text='Check Balance']
${CLOSE_BUTTON}                 //android.widget.TextView[@text='Close']

#*** Sidenav ***
${HAMBURGER_ICON}               //android.view.ViewGroup//android.widget.ImageView

#*** Reloading Partners Page
${RELOADING_PARTNERS}           //android.widget.TextView[@text='Reloading Partners']

#*** Logout ***
${LOGOUT_TAB}                   //android.view.ViewGroup[@index=3]
${CONFIRM_BUTTON}               //android.view.ViewGroup[@index=0]//android.widget.TextView[@text='Confirm']
${CONFIRM_BUTTON}               //android.view.ViewGroup[@index=0]


#*** Forgot Password ***
${FORGOT PASSWORD TEXT}         //android.widget.TextView[@text='Forgot Password?']
${FORGOT PASSWORD TEXT - IOS}   //XCUIElementTypeOther[@name="Forgot Password?"]
${FORGOT PASSWORD FIELD}        //android.widget.EditText

#*** WEB VARIABLES ***

${URL}          https://www.mailinator.com/
${BROWSER}      chromium
${TITLE}        Mailinator

*** Keywords ***
Wait
    Sleep    5s

Run Keyword Until Success
    [Arguments]    ${KW}    @{KWARGS}
    Wait Until Keyword Succeeds    5s      1s  ${KW}    @{KWARGS}

Open Myeasytrip Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=4SPRMFUGIRBQ4PKR    appPackage=${MYEASYTRIP-APPLICATION-ID}      appActivity=${MYEASYTRIP-APPLICATION-ACTIVITY}      automationName=Uiautomator2

Open Myeasytrip Application IOS
    Open Application    http://localhost:4723/wd/hub    platformName=iOS	platformVersion=14.4	deviceName=iPhone 8    automationName=XCUITest      bundleId=ph.easytrip.mobile.app

Sign with User
    [Arguments]     ${EMAIL}     ${USERPASSWORD}
    Input User Email        ${EMAIL}
    Input User Password     ${USERPASSWORD}

Sign Up with User
    sleep    2
    Scroll                                 xpath=//android.widget.TextView[@text='Email']          xpath=//android.widget.TextView[@text='Email']

Tap The Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element       ${locator}
    Click Element                          ${locator}

Forgot Password
    Tap The Element                        ${FORGOT PASSWORD TEXT}
    Input Text                             ${FORGOT PASSWORD FIELD}               ${USER_DETAILS_2}[email]
    Run Keyword Until Success              Click Element                          //android.widget.TextView[@text='Forgot Password?']
    Run Keyword Until Success              Click Element                          //android.widget.TextView[@text='SEND']
    Run Keyword Until Success              Click Element                          //android.widget.TextView[@text='Ok']
    Run Keyword Until Success              Click Element                          //android.view.ViewGroup//android.widget.ImageView

Forgot Password IOS
    Tap The Element                             ${FORGOT PASSWORD TEXT - IOS}

Input Account number
    Run Keyword Until Success           Wait Until Page Contains Element    ${ACCOUNT_NUMBER_FIELD}
    Run Keyword Until Success           Input Text                          ${ACCOUNT_NUMBER_FIELD}     ${ACCOUNT_NUMBER}
    Wait Until Page Contains Element    ${CHECK_BALANCE_BUTTON}
    Click Element                       ${CHECK_BALANCE_BUTTON}
    Wait Until Page Contains Element    //android.widget.TextView[@text='OK']
    Click Element                       //android.widget.TextView[@text='OK']
    Wait Until Page Contains Element    ${CLOSE_BUTTON}
    Click Element                       ${CLOSE_BUTTON}

Input User Email
    [Arguments]     ${EMAIL}
    Verify Login Email Field Displayed
    Run Keyword Until Success       Input Text        ${LOGIN_EMAIL_FIELD}        ${EMAIL}
    Hide Keyboard
#    Sleep    5

Input User Password
    [Arguments]     ${USERPASSWORD}
#    Sleep    5
    Run Keyword Until Success       Wait Until Page Contains Element        ${LOGIN_PASSWORD_FIELD}
    Run Keyword Until Success       Input Text        ${LOGIN_PASSWORD_FIELD}     ${USERPASSWORD}

Submit Login Button
    Run Keyword Until Success       Wait Until Page Contains Element     ${LOGIN_SIGNIN_BUTTON}
    Get Element Location            ${LOGIN_SIGNIN_BUTTON}
    Run Keyword Until Success       Click Element     ${LOGIN_SIGNIN_BUTTON}

Handle Login Failed
    [Arguments]     ${DISPLAY_MESSAGE}
    Run Keyword Until Success       Wait Until Page Contains Element    ${LOGIN_FAILED}
    Run Keyword Until Success       Wait Until Page Contains Element    ${DISPLAY_MESSAGE}
    Run Keyword Until Success       Click Element                       ${OK_BUTTON}

Verify Login Is Successful
    Run Keyword Until Success       Wait Until Page Contains Element              ${HAMBURGER_ICON}

Logout with User
    Click The Logout Button
    Verify Login Email Field Displayed

Click The Hamburger
    Wait Until Page Contains Element              ${HAMBURGER_ICON}
    Click Element                                 ${HAMBURGER_ICON}

Click The Logout Button
    Click The Hamburger
    Run Keyword Until Success           Wait Until Page Contains Element              ${LOGOUT_TAB}
    Run Keyword Until Success           Click Element                                 ${LOGOUT_TAB}
    Run Keyword Until Success           Wait Until Page Contains Element              ${CONFIRM_BUTTON}
    Run Keyword Until Success           Click Element                                 ${CONFIRM_BUTTON}

Verify Login Email Field Displayed
    Run Keyword Until Success           Wait Until Page Contains Element              ${LOGIN_EMAIL_FIELD}

# ====================================================================================

# ***  Browser Library  ***
Open Mailinator
    Open Browser    ${URL}      ${BROWSER}
    Get Title       ==       ${TITLE}

Input Field
    [Arguments]    ${field}     ${value}
    Fill Text    xpath=${field}    ${value}
