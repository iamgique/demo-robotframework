*** Settings ***
Documentation     iconframework demo
Resource          ../keywords/resource.robot

*** Test Cases ***
Check srisuda view call in should be one
    [Documentation]    Check srisuda view call in should be one
    [Tags]    ckeck call in    SmokeTest
    [Timeout]    5 minute
    Open Browser To Welcome Page
    Login to iconrem
    Go to Dashboard REM Summary
    Click Element    id=ddlProject_chosen
    Sleep    1s
    Click Element    //*[@id="ddlProject_chosen"]/div/ul/li[8]
    Sleep    1s
    ${call in}  Get Text  //*[@id="dashboard1"]/div/div[1]/div/div[2]/div/h1
    Should Be Equal    1    ${call in}
    [Teardown]    Close Browser

Check kingdom view call in should be zero
    [Documentation]    Check kingdom view call in should be zero
    [Tags]    ckeck call in    SmokeTest
    [Timeout]    5 minute
    Open Browser To Welcome Page
    Login to iconrem
    Go to Dashboard REM Summary
    Click Element    id=ddlProject_chosen
    Sleep    1s
    Click Element    //*[@id="ddlProject_chosen"]/div/ul/li[3]
    Sleep    1s
    ${call in}  Get Text  //*[@id="dashboard1"]/div/div[1]/div/div[2]/div/h1
    Should Be Equal    0    ${call in}
    [Teardown]    Close Browser