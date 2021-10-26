*** Settings ***
Documentation     A test case for a user is able to create and join the game
Resource          ../../../Resources/resources.robot
#Suite Setup     Open MBC Application
#Test Setup      Launch Application
#Test Teardown    Quit Application
#Suite Teardown    Close Application

*** Test Cases ***
#Terms of Use test case
#    [Tags]    sanity       positive
#    Go To Login Screen      ${LOGIN_BUTTON}
#    Sign With User      ${USER_DETAILS}[email]     ${LOGIN_EMAIL_FIELD}       ${USER_DETAILS}[password]       ${LOGIN_PASSWORD_FIELD}
#    Submit Login Button     ${LOGIN_BUTTON}
#    Handle Modals       ${MODAL_LOGGED_IN_ANOTHER_DEVICE}       ${USE_HERE_BUTTON}
#    ${PASSED}=      Run Keyword And Return Status       Wait Until Page Contains Element        ${VERIFICATION_MODAL}
#    Run Keyword If       '${PASSED}' == 'True'      Handle Verification
#    Wait Until Page Contains Element        ${SKIP_TUTORIAL}
#    Tap The Element     ${SKIP_TUTORIAL}
#    Sleep    5
    # pull to refresh and join the game

Admin create a game
    Open Browser    ${URL}[1]   ${BROWSER}
    Input Field    \#admin_user_email     elvin@mailinator.com
    Input Field    \#admin_user_password      password
    Click       \#admin_user_submit_action > input:nth-child(1)
    # Create a Game
    Click    \#games > a:nth-child(1)
    Click    \#roulettes > a:nth-child(1)
    Click   text=New Roulette
    Click    \#roulette_radio_station_input > span:nth-child(3) > span:nth-child(1) > span:nth-child(1)
    Click    \#select2-roulette_radio_station_id-results > li:nth-child(5)  # Love Radio
    # Location Restriction
    # When click element in ul > li use the css
#    Check Checkbox    \#roulette_location_restriction
#    # Cities
#    Click    \.select2-selection--multiple
#    Input Field    \.select2-search__field       Pangasinan | Binmaley
#    Click    \#select2-roulette_city_ids-results
#    Location restriction type
#    Click    \#roulette_location_restriction_type
#    Click    text=Gps

    #    Dj
    Select Element From List    xpath=/html/body/div/div[4]/div/div/form/div/div/div[1]/li[3]/span/span[1]/span/span[2]     \#select2-roulette_dj_id-results > li:nth-child(5)

    #   Sponsor
    Select Element From List    xpath=/html/body/div/div[4]/div/div/form/div/div/div[1]/li[4]/span/span[1]/span/span[2]     \#select2-roulette_sponsor_id-results > li:nth-child(6)

    #   Title
    Input Field    \#roulette_name   Testing 101

    #   Number of winner
    Input Field    \#roulette_number_of_winner      1

    #   Prize
    Input Field    \#roulette_price     10000

    # Schedule
#    Click    text=Create Roulette
    Type Text    xpath=//*[@id="roulette_schedule"]      1026002021050000pm

    # Redemption details
    Input Field    \#roulette_redemption_details    Rdemption details here ....

    #   Dti Permit
    Input Field    \#roulette_dti_permit    dti_permit12345

    # Winner prompt
    Input Field    \#roulette_winner_prompt     Panalo ka!

    # Create Button
    Click    text=Create Roulette

    Click    text=Let player join

    Log To Console    'Hello, Elvin :)'