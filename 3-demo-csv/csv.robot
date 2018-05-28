*** Settings ***
Library    CSVLib.py

*** Test Cases ***
Test Read CSV file
    ${all users}=    Read CSV File    testCSV.csv
    :FOR  ${user}   in   @{all users}
    \    Log   @{user}[0] - @{user}[1] - @{user}[2]