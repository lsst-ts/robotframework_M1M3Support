*** Settings ***
Documentation    M1M3 State Commands tests.
Force Tags    
Suite Setup    Log Many    host=${Host}    CSC=${subSystem}    timeout=${timeout}
#Suite Teardown    Close All Connections
Library    String
Library    Commands
Resource    Global_Vars.robot

*** Variables ***
${subSystem}    m1m3
${timeout}    30s

*** Test Cases ***
Start Command
    [Tags]    functional
    Comment    Issue Start Command.
    Issue Start Command
    Comment    Verify system enters Disabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    2

Get Settings Applied Event
    [Tags]    functional
	Comment    Verify the SettingsApplied event.
	${valid}    ${data}=    Get Event Settings Applied
	Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal    ${data}    "Default"
