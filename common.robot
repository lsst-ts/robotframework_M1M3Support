*** Settings ***
Documentation    This resource file defines common keywords used by all the SAL test suites.
Library    SALM1M3

*** Keywords ***
Verify Summary State Event Enabled
    Comment    Every sub-State transition triggers a Summary State Event for the Enabled State.
    ${valid}    ${data}=    Get Event Summary State
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    3
