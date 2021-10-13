*** Settings ***
Documentation    This is the resources file keywords
Library     AppiumLibrary
Library     Browser

*** Variables ***
#*** Test variables ***
&{USER_DETAILS}               email=bliimocheck@mailinator.com     wrong_email=adonisyes@mailinator.com    password=Password@123   wrong_password=wrongpassword
&{USER_DETAILS_2}               email=bliimo@mailinator.com    password=Password@123

# *** Login Failed ***
${LOGIN_FAILED}                 //android.widget.TextView[@text='ERROR']
${OK_BUTTON}                    //android.widget.TextView[@text='OK']
${LOGIN_FAILED_EMPTY}      //android.widget.TextView[@text='Fields should not be empty. Please note that your myeasytrip app username and password is different from myeastrip web. Please try again.']
${LOGIN_FAILED_INVALID_CREDENTIALS}      //android.widget.TextView[@text='Log in failed! Invalid email or password.']

#*** APPLICATION Variables ***
${MBC-APPLICATION-ID}              com.mbcapp
${MBC-APPLICATION-ACTIVITY}        ${MBC-APPLICATION-ID}.MainActivity

#*** Login Page ***
${LOGIN_EMAIL_FIELD}            //android.widget.EditText[@text='Email']
${LOGIN_PASSWORD_FIELD}         //android.widget.EditText[@text='Password']
${LOGIN_BUTTON}          //android.widget.TextView[@text='LOG IN']
${LOGIN_WITH_FACEBOOK_BUTTON}       //android.view.ViewGroup[@index=2]

#*** Logged In Another Device ***
${MODAL_LOGGED_IN_ANOTHER_DEVICE}       //android.widget.TextView[@text='You are currently logged in another device']
${USE_HERE_BUTTON}                      //android.widget.TextView[@text='USE HERE']

#*** Verification Modal ***
${VERIFICATION_MODAL}       //android.widget.TextView[@text='VERIFICATION!']
${VERIFIED_BUTTON}          //android.widget.TextView[@text='I have verified my account.']

#*** Game Tutorial ***
${SKIP_TUTORIAL}        //android.widget.TextView[@text='Skip Tutorial']

#*** Registration - EMAIL ***
${EMAIL_FIELD}        //android.widget.EditText[@text='Email Address']
${FIRST_NAME_FIELD}        //android.widget.EditText[@text='First Name']
${LAST_NAME_FIELD}        //android.widget.EditText[@text='Last Name']
${MOBILE_FIELD}     //android.widget.EditText[@text='Mobile No.']
${BIRTHDAY_FIELD}       xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup
${YEAR}     id=android:id/date_picker_header_year
${SELECT_YEAR}     xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.DatePicker/android.widget.LinearLayout/android.widget.ScrollView/android.widget.ViewAnimator/android.widget.ListView/android.widget.TextView[3]
${NORTH_LUZON}      //android.widget.TextView[@text='North Luzon']
${FIRST_NAME}       Bliimo
${LAST_NAME}        Test
${MOBILE_NUMBER}    09123456789

#*** Dashboard Page ***
${PROFILE_ICON}                 //android.view.ViewGroup[@index=2]//android.widget.ImageView[@index=0]

#*** Sidenav ***
${HAMBURGER_ICON}               //android.view.ViewGroup//android.widget.ImageView

#*** Reloading Partners Page
${RELOADING_PARTNERS}           //android.widget.TextView[@text='Reloading Partners']

#*** Logout ***
${NOTIF_TAB}                   //android.widget.TextView[@text='Notification']
${LOGOUT_TAB}                  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.view.ViewGroup[2]/android.widget.ScrollView/android.view.ViewGroup/android.widget.HorizontalScrollView[2]/android.view.ViewGroup

#*** Forgot Password ***
${FORGOT PASSWORD TEXT}         //android.widget.TextView[@text='Forgot your password?']
${FORGOT PASSWORD TEXT - IOS}   //XCUIElementTypeOther[@name="Forgot Password?"]
${FORGOT PASSWORD FIELD}        //android.widget.EditText[@text='Please enter your email']

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

Open MBC Application
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=Galaxy J5 Prime    appPackage=${MBC-APPLICATION-ID}      appActivity=${MBC-APPLICATION-ACTIVITY}      udid=4200933406a59453     automationName=Uiautomator2

Open MBC Application IOS
    # udid -> 3d9405ebce32f773d38e43236ce17f49523e12c2
    Open Application    http://localhost:4723/wd/hub    platformName=iOS	platformVersion=14.7.1	deviceName=Test iPhone    automationName=XCUITest      bundleId=com.mbc.mbcpapremyo

Handle Modals
    [Arguments]     ${MODAL_NAME}       ${BUTTON}
    ${PASSED}=      Run Keyword And Return Status       Wait Until Page Contains Element       ${MODAL_NAME}
    Run Keyword If       ${PASSED}      Tap The Element     ${BUTTON}

Handle Verification
    log to console      'This account is not verified yet!!!'

Handle Sign Up Via Facebook
    log to console      'Handle Sign Up Via Facebook'
    Input Text           //android.widget.EditText[@text='Mobile No.']       0912345678901
    Tap The Element      //android.view.ViewGroup[@index=9]

Sign with User
    [Arguments]     ${EMAIL}     ${USERPASSWORD}
    Input User Email        ${EMAIL}
    Input User Password     ${USERPASSWORD}

Game Tutorial
    FOR     ${i}    IN RANGE        6
        Sleep   3
        Swipe    628    646    59    649
        log to console    ${i}
    END
    Wait Until Page Contains Element        //android.view.ViewGroup[@index=3]      # FINISH TUTORIAL BUTTON
    Tap The Element     //android.view.ViewGroup[@index=3]
    Sleep   5

Sign Up with User
    Sleep   5
    Wait Until Page Contains Element        xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup[4]
    Tap The Element         xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup[4]

Handle Register
    [Arguments]    ${EMAIL}
    Wait Until Page Contains Element        //android.widget.TextView[@text='REGISTER']
    Swipe    352    1133    352    534
    Tap The Element     //android.widget.TextView[@text='SUBMIT']
    Swipe    359    280    347    872
    Wait Until Page Contains Element        ${MOBILE_FIELD}
    Input Text      ${FIRST_NAME_FIELD}     ${FIRST_NAME}
    Input Text      ${LAST_NAME_FIELD}     ${LAST_NAME}
    Input Text      ${EMAIL_FIELD}      ${EMAIL}
    Input Text      ${MOBILE_FIELD}     ${MOBILE_NUMBER}
    Handle Birthday
    # Gender
    Tap The Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup
    Tap The Element    //android.widget.TextView[@text='Male']
    # Region
    Select Region
    # Select Province
    Select Province
    # Select City
    Select City
    # USERNAME
    Input Element       //android.widget.EditText[@text='USERNAME']       ROOT
    Input Element       //android.widget.EditText[@text='PASSWORD']       Password@123
    Input Element       //android.widget.EditText[@text='CONFIRM PASSWORD']       Password@123
    Sleep    3
    Tap The Element    //android.widget.TextView[@text='Terms of Use]
    Handle Modals       //android.widget.TextView[@text='Terms of Use]       //android.widget.TextView[@text='OK']
    Handle Modals       //android.widget.TextView[@text='Privacy Policy]       //android.widget.TextView[@text='OK']
    Swipe    680    1093    687    820
    Tap The Element     //android.widget.TextView[@text='SUBMIT']
    Handle Modals       //android.widget.TextView[@text='Email has already been taken']       //android.widget.TextView[@text='OK']

    Sleep    5
    Log To Console    'Successfully :)'

Handle Birthday
    # Birthday field
    Tap The Element    ${BIRTHDAY_FIELD}
    # id=android:id/date_picker_header_year
    Tap The Element    ${YEAR}
    Swipe    407    511    402    841
    # select 1995
    Tap The Element    ${SELECT_YEAR}
    # August
    Tap The Element    //android.widget.ImageButton[@content-desc="Previous month"]
    Tap The Element    //android.widget.ImageButton[@content-desc="Previous month"]
    # Tap 27
    Tap The Element    //android.view.View[@text=27]
    # id=android:id/button1
    Tap The Element    id=android:id/button1

Select Region
    Tap The Element    //android.widget.TextView[@text='Select Region']
    Tap The Element    ${NORTH_LUZON}

Select Province
    Tap The Element    //android.widget.TextView[@text='Select Province']
    FOR     ${i}    IN RANGE        3
        Swipe    342    915    357    494
        log to console    ${i}
    END
    Tap The Element    //android.widget.TextView[@text='Pangasinan']

Select City
    Tap The Element    //android.widget.TextView[@text='Select City']
    FOR     ${i}    IN RANGE        4
        Swipe    335    867    332    622
        log to console    ${i}
    END
    Tap The Element    //android.widget.TextView[@text='Binmaley']

Input Element
    [Arguments]     ${locator}      ${value}
    Wait Until Page Contains Element       ${locator}
    Input Text      ${locator}      ${value}

Tap The Element
    [Arguments]    ${locator}
    Wait Until Page Contains Element       ${locator}
    Click Element                          ${locator}

Forgot Password
    Tap The Element                        ${FORGOT PASSWORD TEXT}
    Wait Until Page Contains Element       ${FORGOT PASSWORD FIELD}
    Input Text                             ${FORGOT PASSWORD FIELD}               ${USER_DETAILS}[email]
    Run Keyword Until Success              Click Element                          //android.widget.TextView[@text='Confirm']
    Wait Until Page Contains Element       //android.widget.TextView[@text='SUCCESS']
    Run Keyword Until Success              Click Element                          //android.widget.TextView[@text='OK']
    #Check code and Resend Code

Go To Login Screen
    Sleep   5
    Submit Login Button

Forgot Password IOS
    Tap The Element                             ${FORGOT PASSWORD TEXT - IOS}

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
    Run Keyword Until Success       Wait Until Page Contains Element     ${LOGIN_BUTTON}
    Get Element Location            ${LOGIN_BUTTON}
    Run Keyword Until Success       Click Element     ${LOGIN_BUTTON}

Handle Login Failed
    [Arguments]     ${DISPLAY_MESSAGE}
    Run Keyword Until Success       Wait Until Page Contains Element    ${LOGIN_FAILED}
    Run Keyword Until Success       Wait Until Page Contains Element    ${DISPLAY_MESSAGE}
    Run Keyword Until Success       Click Element                       ${OK_BUTTON}

Verify Login Is Successful
    Run Keyword Until Success       Wait Until Page Contains Element              ${HAMBURGER_ICON}

Logout with User
    Click The Logout Button

Click The Logout Button
    Swipe    5    173    176    178         # to view the sidenav
    Swipe    205    1122    207    553      # swipe to view the logout
    Run Keyword Until Success           Wait Until Page Contains Element              ${LOGOUT_TAB}
    Run Keyword Until Success           Click Element                                 ${LOGOUT_TAB}
    Wait Until Page Contains Element        //android.widget.TextView[@text='Radyo, Palaro at Papremyo!']

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
