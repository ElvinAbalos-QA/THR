*** Settings ***
Library         AppiumLibrary
Resource        ../Resources/android-res.robot

*** Test Cases ***

Login
    Open Chat21 Application
    Sign With User      ${USER1-DETAILS}[email]     ${USER1-DETAILS}[password]
    Submit Login Button
    Verify Login Is Successful
    Logout With User
    Sign With User      ${USER2-DETAILS}[email]     ${USER2-DETAILS}[password]
#    Close Application