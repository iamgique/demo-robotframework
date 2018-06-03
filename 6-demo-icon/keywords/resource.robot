*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           ExcelLibrary
Library           String
#Resource          ../config/config.robot

*** Variables ***
${URL_WEB}        http://std.iconrem.com/v43
${BROWSER}        Chrome
${DELAY}          0
${Username}       kittipoom
${Password}       password2
${wrong_username}       kitx
${wrong_password}       kitz

*** Keywords ***
Open Browser To Welcome Page
    Open Browser    ${URL_WEB}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Welcome Page Should Be Open

Welcome Page Should Be Open
    Title Should Be    CRM & REM - STD

Login to iconrem
    Input Text    //*[@name="txtUsername"]    ${Username}
    Input Text    name=txtPassword    ${Password}
    Click Button    //*[@id="btSignIn"]
    Wait Until Page Contains    Database=STD_DEV
    Wait Until Page Contains    Call center

Go to Dashboard REM Summary
    Click Element    //label[@class='icon-button' and contains(.,"Dashboard REM Summary")]
    Wait Until Page Contains    โครงการ

Go to Dashboard Customer Service
    Click Element    //label[@class='icon-button' and contains(.,"Customer Service")]
    Wait Until Page Contains    งานของฉัน

Search in problem customer report
    [Arguments]    ${input}
    Input Text    //*[@id="txtSearchText"]    ${input}
    Click Element    //*[@id="btSearch"]
    Wait Until Page Contains    เลขที่ใบแจ้ง