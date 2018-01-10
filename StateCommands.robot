*** Settings ***
Documentation    M1M3 State Commands tests.
Force Tags    
Suite Setup    Run Keywords    Log Many    ${Host}    ${subSystem}    ${timeout}
...    AND    Create Session    Commander    AND    Create Session    Controller
Suite Teardown    Close All Connections
Library    SSHLibrary
Library    String
Library    Commands
Resource    Global_Vars.robot
Resource    common.robot

*** Variables ***
${subSystem}    m1m3
${timeout}    30s

*** Test Cases ***
M1M3_Start_Command
    [Tags]    functional
    Switch Connection    Commander
    Comment    Issue M1M3_Start_Command.
    Issue Start Command
	${valid}    ${data}=    Get Event Summary State
	Log    ${valid}
	Log    ${data}

M1M3_Standby_Command
	[Tags]    functional
    Switch Connection    Commander
    Comment    Issue M1M3_Standby_Command.
    Issue Standby Command
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data}
