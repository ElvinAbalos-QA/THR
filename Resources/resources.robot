*** Settings ***
Documentation    This is the resources file keywords
Library     Browser
#Library     FakerLibrary
Resource    variables.robot

*** Keywords ***
Wait
    Sleep    5s

Run Keyword Until Success
    [Arguments]    ${KW}    @{KWARGS}
    Wait Until Keyword Succeeds    5s      1s  ${KW}    @{KWARGS}

Open THR
#     Browser.Open Browser    ${URL}[0]      ${BROWSER}
    Browser.New Page    ${URL}[0]
    Set Viewport Size       height=2560     width=1600
    Get Title       ==       ${TITLE}

Input Field
    [Arguments]    ${field}     ${value}
    Wait For Elements State    ${field}
    Fill Text    ${field}    ${value}

Login Successfully
    Click       ${LOGIN_BUTTON}
    Wait For Elements State     //div[contains(text(),'Signed in successfully.')]

Logout Admin
    [Arguments]    ${LOGOUT_BUTTON}
    Click       ${LOGOUT_BUTTON}
    Wait For Elements State     ${EMAIL_FIELD}


