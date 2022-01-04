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

# ***  Browser Library  ***
Open THR
    Browser.Open Browser    ${URL}[0]      ${BROWSER}
    Get Title       ==       ${TITLE}

Input Field
    [Arguments]    ${field}     ${value}
    Wait For Elements State    ${field}
    Fill Text    ${field}    ${value}

Select Element From List
    [Arguments]    ${arrow}     ${list}
    Click    ${arrow}
    Click    ${list}