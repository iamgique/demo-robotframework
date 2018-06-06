*** Settings ***
Library            DatabaseLibrary
Suite Setup        Connect Database
Suite Teardown     Disconnect From Database 

*** Variables ***
${DATASOURCE}    database='xx', user='xx', password='xx', host='xx', port=3306, charset='utf8'

${10001_emp_no}    10001
${10001_birth_date}    1953-09-02
${10001_first_name}    Georgi
${10001_last_name}    Facello
${10001_gender}    M
${10001_hire_date}    1986-06-26

${85333333_emp_no}    85333333
${85333333_birth_date}    2017-12-14
${85333333_first_name}    Ryan
${85333333_last_name}    Gique
${85333333_gender}    M
${85333333_hire_date}    2017-12-14

*** Keywords ***
Connect Database
    Connect To Database Using Custom Params    pymysql    ${DATASOURCE}

*** Test Cases ***
Select employee 10001 Data from database
    ${query_result}    QUERY    SELECT * from `apithaic_forqa`.`employees` WHERE `emp_no` = '10001';
    Should Be Equal As Strings    ${10001_emp_no}              ${query_result[0][0]}
    Should Be Equal As Strings    ${10001_birth_date}       ${query_result[0][1]}
    Should Be Equal As Strings    ${10001_first_name}       ${query_result[0][2]}
    Should Be Equal As Strings    ${10001_last_name}       ${query_result[0][3]}
    Should Be Equal As Strings    ${10001_gender}       ${query_result[0][4]}
    Should Be Equal As Strings    ${10001_hire_date}       ${query_result[0][5]}
    
Test update employee Data to database
    Execute Sql String    INSERT INTO `apithaic_forqa`.`employees` (`emp_no`, `birth_date`, `first_name`, `last_name`, `gender`, `hire_date`) VALUES ('${85333333_emp_no}', '${85333333_birth_date}', '${85333333_first_name}', '${85333333_last_name}', '${85333333_gender}', '${85333333_hire_date}');
    ${query_result}    QUERY    SELECT * from `apithaic_forqa`.`employees` WHERE `emp_no` = '85333333';
    Should Be Equal As Strings    ${85333333_emp_no}              ${query_result[0][0]}
    Should Be Equal As Strings    ${85333333_birth_date}       ${query_result[0][1]}
    Should Be Equal As Strings    ${85333333_first_name}       ${query_result[0][2]}
    Should Be Equal As Strings    ${85333333_last_name}       ${query_result[0][3]}
    Should Be Equal As Strings    ${85333333_gender}       ${query_result[0][4]}
    Should Be Equal As Strings    ${85333333_hire_date}       ${query_result[0][5]}
    Execute Sql String    UPDATE `apithaic_forqa`.`employees` SET `first_name` = 'Test Name' WHERE `employees`.`emp_no` = '${85333333_emp_no}';
    ${query_result}    QUERY    SELECT * from `apithaic_forqa`.`employees` WHERE `emp_no` = '85333333';
    Should Be Equal As Strings    Test Name       ${query_result[0][2]}
    Execute Sql String    DELETE FROM `apithaic_forqa`.`employees` WHERE `employees`.`emp_no` = 85333333
    ${query_result}    QUERY    SELECT * from `apithaic_forqa`.`employees` WHERE `emp_no` = '85333333';
    Should Be Equal As Strings      ()            ${query_result}
