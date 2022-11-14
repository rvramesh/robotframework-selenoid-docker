*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Firefox
${DELAY}          1
${URL}      https://google.co.in/
${SELENOID_SERVER}    http://selenoid:4444/wd/hub
&{DESIRED_CAPABILITIES}    name=browserTest,enableVideo=${True},enableVNC=${True}

*** Keywords ***
Open Browser To Search Page
    Open Browser    ${URL}    ${BROWSER}    None    remote_url=${SELENOID_SERVER}   desired_capabilities=${DESIRED_CAPABILITIES}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Sleep    3
    Search Page Should Be Open

Search Page Should Be Open
    Title Should Be    Google

Input Search term
    [Arguments]    ${searchterm}
    Input Text    q    ${searchterm}

Submit
    Click Button    btnK

*** Test Cases ***
Valid Login
    Open Browser To Search Page
    Input Search term    demo
    Submit
    [Teardown]    Close Browser