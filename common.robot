*** Settings ***
Documentation    This resource file defines common keywords used by all the SAL test suites.
Library    M1M3_SAL

*** Keywords ***
Verify Summary State Event
    [Arguments]    ${expectedState}
    Comment    Every sub-State transition triggers a Summary State Event.
    ${valid}    ${data}=    Get Event Summary State
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${expectedState}

Verify Detailed State Event 
    [Arguments]    ${expectedState}
    Comment    Every State transition triggers a Detailed State Event.
    ${valid}    ${data}=    Get Event Detailed State
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${expectedState}

Verify Timestamp 
    [Arguments]    ${timestamp}=${0}
    Comment    Get current time in epoch.
    ${epoch}=    Get Current Date    result_format=epoch
    Comment    Verify timestamp.
    Should Be True    ${timestamp} > ${epoch}

Verify Rational Topic Attribute
    [Documentation]    This keyword requires the data object, the name of the attribute and then each expected value, in order, as arguments.
    [Arguments]    ${data}    ${attribute}    @{ExpectedValues}
    Log Many    Attribute: ${attribute}    Expected Values: @{ExpectedValues}
    ${len}=    Get Length    ${ExpectedValues}
    ${index}=    Set Variable If    ${len} > ${1}    [${0}]    ${EMPTY}
    : FOR    ${ExpectedValue}    IN     @{ExpectedValues}
    \    Log    ${attribute}${index} Actual Value = ${data.${attribute}${index}}
    \    Run Keyword And Continue On Failure    Should Be Equal As Integers    ${data.${attribute}${index}}    ${ExpectedValue}
    \    ${index}=    Evaluate    [${index}[${0}] + ${1}]

Verify Irrational Topic Attribute
    [Documentation]    This keyword requires the data object, the name of the attribute, the tolerance and then each expected value, in order, as arguments.
    [Arguments]    ${data}    ${attribute}    ${tolerance}    @{ExpectedValues}
    Log Many    Attribute: ${attribute}    Tolerance: ${tolerance}    Expected Values: @{ExpectedValues}
    ${len}=    Get Length    ${ExpectedValues}
    ${index}=    Set Variable If    ${len} > ${1}    [${0}]    ${EMPTY}
    : FOR    ${ExpectedValue}    IN     @{ExpectedValues}
    \    Log    ${attribute}${index} Actual Value = ${data.${attribute}${index}}
    \    ${high}=    Evaluate    ${data.${attribute}${index}} + ${tolerance}
    \    ${low}=    Evaluate    ${data.${attribute}${index}} - ${tolerance}
    \    Run Keyword And Continue On Failure    Should Be True    ${data.${attribute}${index}} <= ${high}
    \    Run Keyword And Continue On Failure    Should Be True    ${data.${attribute}${index}} >= ${low}
    \    ${index}=    Evaluate    [${index}[${0}] + ${1}]
