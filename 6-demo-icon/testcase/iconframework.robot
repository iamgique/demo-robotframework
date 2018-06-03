*** Settings ***
Library           Selenium2Library
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           ExcelLibrary
Library           String

*** Variables ***
${URL_WEB}        http://std.iconrem.com/v43
${Username}       kittipoom
${Password}       password2

*** Test Cases ***
Login valid
    [Documentation]    Login IConFramework
    [Tags]    Login valid    SmokeTest
    [Timeout]    5 minute
    Open Browser    ${URL_WEB}    gc
    Maximize Browser Window
    #Wait Until Page Contains    USER
    Set Selenium Speed    2s
    Input Text    //*[@name="txtUsername"]    User01
    Input Text    name=txtUsername    User02
    Input Text    txtUsername    kittipoom
    Input Text    txtPassword    password2
    Click Button    //*[@id="btSignIn"]
    Wait Until Page Contains    Database=STD_DEV
    Wait Until Page Contains    Call center
    Click Element    //label[@class='icon-button' and contains(.,"Customer Relationship Management")]
    Wait Until Page Contains    Collaborative Analytic Report
    Select From List By Label    id=ddOwnerTarget    Santi Rattanachuwong
    Select From List By Label    id=ddOwnerTarget    เอกรัตน์ สาธารณสุข
    Select From List By Label    //*[@id="ddlmonthTeam"]    February
    Select From List By Label    //*[@id="ddlyearTeam"]    2017
    Click Link    //a[contains(.,"ฐานข้อมูลลูกค้า")]
    Wait Until Page Contains    ฐานข้อมูลลูกค้า
    Element Should Be Enabled    //div[@class="icon-tile" and contains(.,"ณัฐพงศ์ วงศ์อัครวัฒน์")]//input
    Click Element    //div[@class="icon-tile" and contains(.,"ณัฐพงศ์ วงศ์อัครวัฒน์")]//input
    Click Element    //div[@class="icon-tile"]/div[@class="frame"]/div[@class="info"]/div[@style="width:100%;"]/input
    Execute JavaScript    $('.icon-tile input').click().change()