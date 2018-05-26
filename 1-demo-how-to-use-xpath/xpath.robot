*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Find XPath
    Open Browser    https://www.kingpower.com/    Chrome
    Maximize Browser Window
    Set Selenium Speed    0
    Sleep    3s
    Input Text    header-input-text-search    perfume
    Click Element    header-search-box-button
    Wait Until Page Contains    perfume
    Sleep    3s
    Input Text    //*[@id="header-search-box-input-text"]    swatch
    Click Element    //*[@id="header-search-box-button"]
    Wait Until Page Contains    swatch
    Sleep    3s
    [Teardown]    Close Browser