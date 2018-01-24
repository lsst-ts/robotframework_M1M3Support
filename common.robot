*** Settings ***
Documentation    This resource file defines common keywords used by all the SAL test suites.
Library    M1M3_SAL

*** Keywords ***
Verify Summary State Event Enabled
    Comment    Every sub-State transition triggers a Summary State Event for the Enabled State.
    ${valid}    ${data}=    Get Event Summary State
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    3

Verify Timestamp 
    [Arguments]    ${timestamp}=${0}
    Comment    Get current time in epoch.
    ${epoch}=    Get Current Date    result_format=epoch
    Comment    Verify timestamp.
    Should Be True    ${timestamp} > ${epoch}
