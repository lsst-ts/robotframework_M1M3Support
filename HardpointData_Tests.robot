*** Settings ***
Documentation    M1M3 IMS Telemetry tests.
Force Tags    
Suite Setup    Log Many    host=${Host}    CSC=${subSystem}    timeout=${timeout}
#Suite Teardown    Close All Connections
Library    String
Library    DateTime
Library    M1M3_SAL
Library    M1M3_Simulator
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

Get Hardpoint Monitor Info Event - Disabled
    [Tags]    functional
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event 
    Should Be True    ${valid}

Get Hardpoint Monitor Status Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${hpmidata}=    Get Hardpoint Monitor Info Telemetry
    Set Suite Variable    ${hpmidata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Get to Enabled-Parked State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${5}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - Parked
    [Tags]    functional
    ${valid}    ${hpmidata}=    Get Hardpoint Monitor Info Telemetry
    Set Suite Variable    ${hpmidata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - Parked
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Get to Disabled State - Cleanup
    [Tags]    functional
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
Get Hardpoint Monitor Info Event
    Comment    Verify system publishes Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Event Hardpoint Monitor Info
    Log    ${data.Timestamp}
    Log    ${data.ApplicationCRCMismatch}
    Log    ${data.ApplicationMissing}
    Log    ${data.ApplicationTypeMismatch}
    Log    ${data.ILCApplicationType}
    Log    ${data.ILCSelectedOptions}
    Log    ${data.ILCUniqueId}
    Log    ${data.MajorRevision}
    Log    ${data.MezzanineApplicationCRCMismatch}
    Log    ${data.MezzanineApplicationMissing}
    Log    ${data.MezzanineBootloaderActive}
    Log    ${data.MezzanineDCPRS422ChipFault}
    Log    ${data.MezzanineFirmwareType}
    Log    ${data.MezzanineMajorRevision}
    Log    ${data.MezzanineMinorRevision}
    Log    ${data.MezzanineUniqueId}
    Log    ${data.MezzanineUniqueIdCRCError}
    Log    ${data.MinorRevision}
    Log    ${data.ModbusAddress}
    Log    ${data.ModbusSubnet}
    Log    ${data.NetworkNodeOptions}
    Log    ${data.NetworkNodeType}
    Log    ${data.OneWire1Mismatch}
    Log    ${data.OneWire2Mismatch}
    Log    ${data.OneWireMissing}
    Log    ${data.ReferenceId}
    Log    ${data.UniqueIdCRCError}
    [Return]    ${valid}    ${data}

Get Hardpoint Monitor Info Telemetry
    Comment    Verify system publishes Hardpoint Monitor Status Telemetry.
    ${valid}    ${data}=    Get Sample Hardpoint Monitor Status
    Log    ${data.Timestamp}
    Log    ${data.Mode}
    Log    ${data.MajorFault}
    Log    ${data.MinorFault}
    Log    ${data.FaultOverridden}
    Log    ${data.WatchdogReset}
    Log    ${data.BrownoutDetected}
    Log    ${data.EventTrapReset}
    Log    ${data.MotorPowerFault}
    Log    ${data.SSRPowerFault}
    Log    ${data.AUXPowerFault}
    Log    ${data.SMCPowerFault}
    [Return]    ${valid}    ${data}

Get Hardpoint Data Telemetry
    Comment    Verify system publishes Hardpoint Data Telemetry.
    ${valid}    ${data}=    Get Sample Hardpoint Data
    Log    ${data.Timestamp}
    Log    ${data.BreakawayLVDT}
    Log    ${data.BroadcastCounter}
    Log    ${data.CCWLimitOperated}
    Log    ${data.CWLimitOperated}
    Log    ${data.Displacement}
    Log    ${data.DisplacementLVDT}
    Log    ${data.Encoder}
    Log    ${data.Force}
    Log    ${data.ILCFault}
    Log    ${data.StepsCommanded}
    Log    ${data.StepsQueued}
    Log    ${data.XPosition}
    Log    ${data.XRotation}
    Log    ${data.YPosition}
    Log    ${data.YRotation}
    Log    ${data.ZPosition}
    Log    ${data.ZRotation}
    [Return]    ${valid}    ${data}

Verify Displacement Telemetry
    [Arguments]    @{Displacements}
    Comment    Verify correct number of displacement readings.
    Log Many    @{Displacements}
    ${len}=    Get Length    ${Displacements}
    Should Be Equal As Numbers    ${len}    ${8}
    Comment    Verify each displacement sensor reading.
    ${index}=    Set Variable    ${0}
    : FOR    ${sensor}    IN    @{Displacements}
    \    Log    ${data.RawSensorData[${index}]}
    \    Run Keyword And Continue On Failure    Should Be Equal As Numbers    ${sensor}    ${data.RawSensorData[${index}]}
    \    ${index}=    Set Variable    ${index+1}

Verify Position Telemetry
    [Arguments]    @{Positions}
    Log Many    @{Positions}
    ${len}=    Get Length    ${Positions}
    Should Be Equal As Numbers    ${len}    ${3}
    Comment    Verify each position calculation.
    Log Many    ${data.XPosition}    ${data.YPosition}    ${data.ZPosition}
    ${tolerance}=    Set Variable    ${0.0001}
    ${XHigh}=    Evaluate    ${@{Positions}[0]} + ${tolerance}
    ${XLow}=    Evaluate    ${@{Positions}[0]} - ${tolerance}
    ${YHigh}=    Evaluate    ${@{Positions}[1]} + ${tolerance}
    ${YLow}=    Evaluate    ${@{Positions}[1]} - ${tolerance}
    ${ZHigh}=    Evaluate    ${@{Positions}[2]} + ${tolerance}
    ${ZLow}=    Evaluate    ${@{Positions}[2]} - ${tolerance}
    Should Be True    ${data.XPosition} <= ${XHigh}
    Should Be True    ${data.XPosition} >= ${XLow}
    Should Be True    ${data.YPosition} <= ${YHigh}
    Should Be True    ${data.YPosition} >= ${YLow}
    Should Be True    ${data.ZPosition} <= ${ZHigh}
    Should Be True    ${data.ZPosition} >= ${ZLow}

Verify Rotation Telemetry
    [Arguments]    @{Rotations}
    Log Many    @{Rotations}
    ${len}=    Get Length    ${Rotations}
    Should Be Equal As Numbers    ${len}    ${3}
    Comment    Verify each rotational position calculation.
    Log Many    ${data.XRotation}    ${data.YRotation}    ${data.ZRotation}
    ${tolerance}=    Set Variable    ${0.0001}
    ${XHigh}=    Evaluate    ${@{Rotations}[0]} + ${tolerance}
    ${XLow}=    Evaluate    ${@{Rotations}[0]} - ${tolerance}
    ${YHigh}=    Evaluate    ${@{Rotations}[1]} + ${tolerance}
    ${YLow}=    Evaluate    ${@{Rotations}[1]} - ${tolerance}
    ${ZHigh}=    Evaluate    ${@{Rotations}[2]} + ${tolerance}
    ${ZLow}=    Evaluate    ${@{Rotations}[2]} - ${tolerance}
    Should Be True    ${data.XRotation} <= ${XHigh}
    Should Be True    ${data.XRotation} >= ${XLow}
    Should Be True    ${data.YRotation} <= ${YHigh}
    Should Be True    ${data.YRotation} >= ${YLow}
    Should Be True    ${data.ZRotation} <= ${ZHigh}
    Should Be True    ${data.ZRotation} >= ${ZLow}
