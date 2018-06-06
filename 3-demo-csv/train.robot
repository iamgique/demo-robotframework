*** Settings ***
Library    CSVLib.py
Library           Collections

*** Variables ***
@{csv first row}    somsak    saksith    30
@{csv second row}    wutthichai    sombatcharoen    40
@{csv third row}    sarot    ${empty}    30
@{csv fourth row}    macintosh    ${empty}    35
@{csv fifth row}    ${empty}    mcmanaman    25
@{csv sixth row}    hyundai    jaidee    ${empty}
@{csv seventh row}    ${empty}    ${empty}    16
@{csv eighth row}    ${empty}    ${empty}    ${empty}
@{listoflists}    ${csv first row}    ${csv second row}    ${csv third row}    ${csv fourth row}    ${csv fifth row}    ${csv sixth row}    ${csv seventh row}    ${csv eighth row}

#List a = [1,2,3,4]
#List b = [5,6,7,8]
#ArrayList c = [[1,2,3,4],[5,6,7,8]]

*** Keywords ***
Loop in item
    [Arguments]  ${index}    ${all in csv}
    : FOR    ${column}    IN RANGE    0    3
    \    Log    ${column}
    \    Log    ${all in csv[${index}][${column}]}
    \    Log    ${listoflists[${index}][${column}]}
    \    Should Be Equal    ${listoflists[${index}][${column}]}    ${all in csv[${index}][${column}]}

*** Test Cases ***
Test Read CSV with Assert
    ${all in csv}=    Read CSV File    testCSV.csv
    ${count}=    Get length    ${all in csv}
    : FOR    ${index}    IN RANGE    0    ${count}
    \    Loop in item    ${index}    ${all in csv}

Test list
    Log to console    ${listoflists}

Test Read CSV file
    ${all users}=    Read CSV File    testCSV.csv
    :FOR  ${user}   in   @{all users}
    \    Log   @{user}[0] - @{user}[1] - @{user}[2]