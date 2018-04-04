*** Settings ***
Documentation    M1M3 Inclinometer Telemetry tests.  The inclinometer simulator should start at 0.0.
Force Tags    
Suite Setup    Log Many    host=${Host}    CSC=${subSystem}    timeout=${timeout}
#Suite Teardown    Close All Connections
Library    String
Library    DateTime
Library    Library/M1M3_Simulator.py
Resource    common.robot
Resource    Global_Vars.robot
Library    Library/M1M3_SAL.py

*** Variables ***
${subSystem}    m1m3
${timeout}    30s

*** Test Cases ***
Get to Disabled State
    [Tags]    functional
    Comment    Issue Start Command.
    Issue Start Command
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${DetailedDisabled}

Verify Summary State Event - Disabled
    [Tags]    functional
    Comment    Verify system enters Disabled Summary State.
    Verify Summary State Event    ${SummaryDisabled}

Verify Inclinometer Telemetry - Disabled
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - Disabled
    [Tags]    functional
    Set Inclinometer    ${12.34}
    Verify Inclinometer Telemetry    ${12.34}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Get to Enabled-Parked State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${DetailedParked}

Verify Summary State Event - Parked
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - Parked
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - Parked
    [Tags]    functional
    Set Inclinometer    ${6.86}
    Verify Inclinometer Telemetry    ${6.86}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Get to Enabled-Raising State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${DetailedRaising}

Verify Summary State Event - Raising
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - Raising
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - Raising
    [Tags]    functional
    Set Inclinometer    ${36.65}
    Verify Inclinometer Telemetry    ${36.65}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0} 

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActive}

Verify Summary State Event - Raise Complete
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - Active
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - Active
    [Tags]    functional
    Set Inclinometer    ${71.80}
    Verify Inclinometer Telemetry    ${71.80}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Get to Enabled-Lowering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters Lowering State.
    Verify Detailed State Event    ${DetailedLowering}

Verify Summary State Event - Lowering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - Lowering
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - Lowering
    [Tags]    functional
    Set Inclinometer    ${87.38}
    Verify Inclinometer Telemetry    ${87.38}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParked}

Verify Summary State Event - Lower Complete
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Get to ParkedEngineering State
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${DetailedParkedEngineering}

Verify Summary State Event - ParkedEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - ParkedEngineering
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - ParkedEngineering
    [Tags]    functional
    Set Inclinometer    ${0.16}
    Verify Inclinometer Telemetry    ${0.16}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Get to Enabled-RaisingEngineering State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering State.
    Verify Detailed State Event    ${DetailedRaisingEngineering}

Verify Summary State Event - RaisingEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - RaisingEngineering
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - RaisingEngineering
    [Tags]    functional
    Set Inclinometer    ${16.46}
    Verify Inclinometer Telemetry    ${16.46}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActiveEngineering}

Verify Summary State Event - RaisingEngineering Complete
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - ActiveEngineering
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - ActiveEngineering
    [Tags]    functional
    Set Inclinometer    ${79.41}
    Verify Inclinometer Telemetry    ${79.41}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Get to Enabled-LoweringEngineering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters LoweringEngineering State.
    Verify Detailed State Event    ${DetailedLoweringEngineering}

Verify Summary State Event - LoweringEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Inclinometer Telemetry - LoweringEngineering
    [Tags]    functional
    Verify Inclinometer Telemetry    ${0.0}

Set Inclinometer - LoweringEngineering
    [Tags]    functional
    Set Inclinometer    ${40.30}
    Verify Inclinometer Telemetry    ${40.30}
    Set Inclinometer    ${0.0}
    Verify Inclinometer Telemetry    ${0.0}

Wait Until Engineering Lower Completes
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParkedEngineering}

Verify Summary State Event - LoweringEngineering Complete
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Get to Disabled State - Cleanup
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    Verify Detailed State Event    ${DetailedDisabled}

Verify Summary State Event - Cleanup Disabled
    [Tags]    functional
    Comment    Verify system enters Disabled Summary State.
    Verify Summary State Event    ${SummaryDisabled}

Get to Standby State - Cleanup
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    Verify Detailed State Event    ${DetailedStandby}

Verify Summary State Event - Cleanup Standby
    [Tags]    functional
    Comment    Verify system enters Standby Summary State.
    Verify Summary State Event    ${SummaryStandby}

Get Inclinometer Telemetry - Standby
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${timestamp}    ${data}=    Get Sample Inclinometer Data
    Comment    Verify system does NOT publish Inclinometer Telemetry.
    ${valid}    ${timestamp}    ${data}=    Get Sample Inclinometer Data
    Should Not Be True    ${valid}
    Should Be True    ${timestamp} == ${0.0}
    Comment    Get another reading to be sure no data is published.
    ${valid}    ${timestamp}    ${data}=    Get Sample Inclinometer Data
    Should Not Be True    ${valid}
    Should Be True    ${timestamp} == ${0.0}

*** Keywords ***
Verify Inclinometer Telemetry
    [Arguments]    ${value}=${0.0}
    Comment    Get current time in epoch.
    ${epoch}=    Get Current Date    result_format=epoch
    Comment    Verify system publishes Inclinometer Telemetry.
    ${valid}    ${timestamp}    ${data}=    Get Sample Inclinometer Data
    Log    ${valid}
    Log    ${timestamp}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Numbers    ${data}    ${value}    precision=2
    Comment    TSS-
    Comment    Should Be True    ${timestamp} > ${epoch}
