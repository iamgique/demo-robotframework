*** Settings ***
Documentation     iconframework demo
Resource          ../keywords/resource.robot

*** Test Cases ***
Check search complain sale problem customer report
    [Documentation]    Check search complain sale problem customer report
    [Tags]    ckeck problem report    SmokeTest
    [Timeout]    5 minute
    Open Browser To Welcome Page
    Login to iconrem
    Go to Dashboard Customer Service
    Click Element    //*[@id="TopMenu"]/li[4]/a
    Wait Until Page Contains    รายการแจ้งปัญหาทั้งหมด
    Wait Until Page Contains    เลขที่ใบแจ้ง
    Sleep    1s
    Search in problem customer report    CC-0000125-18050003
    Sleep    1s
    Wait Until Page Contains    CC-0000125-18050003
    Wait Until Page Contains    Complain Sale
    Wait Until Page Contains    Inprocess
    [Teardown]    Close Browser