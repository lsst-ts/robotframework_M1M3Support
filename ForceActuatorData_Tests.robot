*** Settings ***
Documentation    M1M3 IMS Telemetry tests.
Force Tags    
Suite Setup    Log Many    host=${Host}    CSC=${subSystem}    timeout=${timeout}
#Suite Teardown    Close All Connections
Library    String
Library    DateTime
Library    RFLibraries/M1M3_SAL
Library    RFLibraries/M1M3_Simulator
Resource    common.robot
Resource    Global_Vars.robot

*** Variables ***
${subSystem}    m1m3
${timeout}    30s

*** Test Cases ***
Get to Disabled State
    [Tags]    functional
    Comment    Issue Start Command.
    Issue Start Command
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${2}

Verify Summary State Disabled Event
    Comment    Verify system enters Disabled Summary State.
    Verify Summary State Event    ${2}

Get Force Actuator Data Telemetry
    [Tags]    functional
    ${valid}    ${data}=    Get Force Actuator Data Telemetry 
    Should Be True    ${valid}

Get to Disabled State - Cleanup
    [Tags]    functional    skipped
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    Verify Summary State Event    ${2}
    Verify Detailed State Event    ${2}

Get to Standby State - Cleanup
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    Verify Summary State Event    ${1}
    Verify Detailed State Event    ${1}

*** Keywords ***
Get Force Actuator Data Telemetry
    Comment    Verify system publishes Force Actuator Data Telemetry.
    ${valid}    ${data}=    Get Sample Force Actuator Data
    Log    ${data.Timestamp}
    Log    ${data.AberrationZSetpoint}
    Log    ${data.ActiveOpticsZSetpoint}
    Log    ${data.AzimuthXSetpoint}
    Log    ${data.AzimuthYSetpoint}
    Log    ${data.AzimuthZSetpoint}
    Log    ${data.DynamicXSetpoint}
    Log    ${data.DynamicYSetpoint}
    Log    ${data.DynamicZSetpoint}
    Log    ${data.ElevationSetpointPercentage}
    Log    ${data.ElevationXSetpoint}
    Log    ${data.ElevationYSetpoint}
    Log    ${data.ElevationZSetpoint}
    Log    ${data.HardpointOffloadXSetpoint}
    Log    ${data.HardpointOffloadYSetpoint}
    Log    ${data.HardpointOffloadZSetpoint}
    Log    ${data.OffsetXSetpoint}
    Log    ${data.OffsetYSetpoint}
    Log    ${data.OffsetZSetpoint}
    Log    ${data.PrimaryCylinderSetpointCommanded}
    Log    ${data.SecondaryCylinderSetpointCommanded}
    Log    ${data.StaticXSetpoint}
    Log    ${data.StaticYSetpoint}
    Log    ${data.StaticZSetpoint}
    Log    ${data.TemperatureXSetpoint}
    Log    ${data.TemperatureYSetpoint}
    Log    ${data.TemperatureZSetpoint}
    Log    ${data.XSetpoint}
    Log    ${data.YSetpoint}
    Log    ${data.ZSetpoint}
    [Return]    ${valid}    ${data}
