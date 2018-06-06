*** Settings ***
Library           Collections
Library           OperatingSystem

*** Variables ***
@{lists}    test list 1    test list 2    test list 3    test list 4

# ${lists[index]}
# ${lists}[index]
# ${Number_base}=    Evaluate    2 * ${Index}

*** Keywords ***
KW_LoopMultiply
    [Arguments]    ${Var_Number_base}=Empty
    [Documentation]    Keyword Set Variable
    : FOR    ${Count_Multiply}    IN RANGE    1    13
    \    ${Formula_Multiply}=    Evaluate    ${Var_Number_base} * ${Count_Multiply}
    \    Log To Console    ${Var_Number_base} * ${Count_Multiply} = ${Formula_Multiply}

*** Test Cases ***
Calculate_Multiply_02
    [Documentation]    Create Variable Array
    [Tags]    Create_Array    StringAndVariable
    [Setup]    Log To Console    \n======================\n
    : FOR    ${Number_base}    IN RANGE    2    12
    \    KW_LoopMultiply    ${Number_base}
    \    Log To Console    \n******************\n
    [Teardown]    Log To Console    \n======================\n

Calculate_Multiply_01
    [Documentation]    Create Variable Array
    [Tags]    Create_Array    StringAndVariable
    [Setup]    Log To Console    \n======================\n
    : FOR    ${Index}    IN RANGE    1    13
    \    ${Number_base}=    Evaluate    2 * ${Index}
    \    Log To Console    2 * ${Index} = ${Number_base}
    [Teardown]    Log To Console    \n======================\n

Example
    : FOR    ${i}    IN RANGE    0    4
    \    Log to console    ${lists[${i}]}
    \    Log 

Loop in range
    : FOR    ${index}    IN RANGE    0    20
    \    Log to console    ${index}

    #for(i=0; i<20; i++){
    #    print i;
    #}

Loop in list
    : FOR    ${list}    in    @{lists}
    \    Log    ${list}