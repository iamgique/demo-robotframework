*** Settings ***
Documentation     iconframework demo
Resource          ../keywords/resource.robot

*** Test Cases ***
Login valid
    [Documentation]    Valid login IConFramework
    [Tags]    Login valid    SmokeTest
    [Timeout]    5 minute
    Open Browser To Welcome Page
    Set Selenium Speed    0s
    Input Text    //*[@name="txtUsername"]    ${Username}
    Input Text    name=txtPassword    ${Password}
    Click Button    //*[@id="btSignIn"]
    Wait Until Page Contains    Database=STD_DEV
    Wait Until Page Contains    Call center
    [Teardown]    Close Browser

Login invalid
    [Documentation]    Invalid login IConFramework
    [Tags]    Login invalid    SmokeTest
    [Timeout]    5 minute
    Open Browser To Welcome Page
    Set Selenium Speed    0s
    Input Text    //*[@name="txtUsername"]    ${wrong_username}
    Input Text    name=txtPassword    ${wrong_password}
    Click Button    //*[@id="btSignIn"]
    Wait Until Page Contains    There is no row at position 0.
    [Teardown]    Close Browser