*** Settings ***
Documentation     If condition Example
Suite Setup       Log To Console    Start Code Loop
Test Timeout      30 seconds
Library           Selenium2Library
Library           Collections
Library           OperatingSystem
Library           DateTime
Library           String

*** Variables ***
@{lists}    test list 1    test list 2    test list 3    test list 4

*** Test Cases ***
Loop in range
    : FOR    ${index}    IN RANGE    0    20
    \    Log    ${index}

Loop in list
    : FOR    ${list}    in    @{lists}
    \    Log    ${list}

Create Array
    @{Ary_Input}    Create List
    : FOR    ${Index}    IN RANGE    0    20
    \    @{Ary_Input}    Create List    @{Ary_Input}    ${Index}
    Log To Console    ${Ary_Input}
    Log List    ${Ary_Input}

#Calculate_Multiply_01
#    [Documentation]    Create Variable Array
#    [Tags]    Create_Array    StringAndVariable
#    [Setup]    Log To Console    \n======================\n
#    : FOR    ${Index}    IN RANGE    1    12
#    \    ${Number_base}=    Evaluate    2 * ${Index}
#    \    Log To Console    2 * ${Index} = ${Number_base}
#    [Teardown]    Log To Console    \n======================\n

#Calculate_Multiply_02
#    [Documentation]    Create Variable Array
#    [Tags]    Create_Array    StringAndVariable
#    [Setup]    Log To Console    \n======================\n
#    : FOR    ${Number_base}    IN RANGE    2    12
#    \    KW_LoopMultiply    ${Number_base}
#    \    Log To Console    \n******************\n
#    [Teardown]    Log To Console    \n======================\n

*** Keywords ***
KW_LoopMultiply
    [Arguments]    ${Var_Number_base}=Empty
    [Documentation]    Keyword Set Variable
    : FOR    ${Count_Multiply}    IN RANGE    1    13
    \    ${Formula_Multiply}=    Evaluate    ${Var_Number_base} * ${Count_Multiply}
    \    Log To Console    ${Var_Number_base} * ${Count_Multiply} = ${Formula_Multiply}
