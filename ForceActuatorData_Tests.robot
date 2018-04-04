*** Settings ***
Documentation    M1M3 Force Actuator Telemetry tests.
Force Tags    
Suite Setup    Run Keywords    M1M3_Simulator.Set to Defaults    AND    Log Many    host=${Host}    CSC=${subSystem}
Suite Teardown    M1M3_Simulator.Set to Defaults
Library    String
Library    DateTime
Library    Library/M1M3_Simulator.py
Resource    common.robot
Resource    Global_Vars.robot
Variables    Library/M1M3_ReferenceData.py
Library    Library/M1M3_SAL.py

*** Variables ***
${subSystem}    m1m3

*** Test Cases ***
Get to Disabled State
    [Tags]    functional
    Comment    Issue Start Command.
    Issue Start Command
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${DetailedDisabled}

Verify Summary State Disabled Event
    [Tags]    functional
    Comment    Verify system enters Disabled Summary State.
    Verify Summary State Event    ${SummaryDisabled}

############ BEGIN Verify Force Actuator Info Event Attributes ############

Get Force Actuator Info Event - Disabled
    [Tags]    functional
    Comment    The ForceActuatorInfo Event is only published on the Start Command, from Standby to Disabled.
    Comment    Use the Get Event keyword, to clear out old Force Actuator Info events.
    ${valid}    ${faidata}=    Get Event    Force Actuator Info
    Set Suite Variable    ${faidata}
    Should Be True    ${valid}
    Report Force Actuator Info Event    ${faidata}

Verify Force Actuator Info Event - ActuatorType
    [Tags]    functional
    Comment    ActuatorType is configured in the M1M3 Control software settings.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Should Be Equal    ${faidata.ActuatorType[${index}]}    ${row[${forceActuatorTableTypeIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}
    #Verify Force Actuator Info    ActuatorType    ${forceActuatorTableTypeIndex}

Verify Force Actuator Info Event - ActuatorOrientation
    [Tags]    functional
    Comment    ActuatorOrientation is configured in the M1M3 Control software settings. 
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Should Be Equal    ${faidata.ActuatorOrientation[${index}]}    ${row[${forceActuatorTableOrientationIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}
    #Verify Force Actuator Info    ActuatorOrientation    ${forceActuatorTableOrientationIndex}

Verify Force Actuator Info Event - ADCScanRate
    [Tags]    functional    skipped
    Comment    ADCScanRate is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    ADCScanRate    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - BackupPrimaryCylinderCoefficient
    [Tags]    functional    skipped
    Comment    BackupPrimaryCylinderCoefficient is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    BackupPrimaryCylinderCoefficient    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - BackupSecondaryCylinderCoefficient
    [Tags]    functional    skipped
    Comment    BackupSecondaryCylinderCoefficient is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    BackupSecondaryCylinderCoefficient    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - BackupPrimaryCylinderLoadCellOffset
    [Tags]    functional    skipped
    Comment    BackupPrimaryCylinderLoadCellOffset is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    BackupPrimaryCylinderLoadCellOffset    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - BackupSecondaryCylinderLoadCellOffset
    [Tags]    functional    skipped
    Comment    BackupSecondaryCylinderLoadCellOffset is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    BackupSecondaryCylinderLoadCellOffset    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - BackupPrimaryCylinderLoadCellSensitivity
    [Tags]    functional    skipped
    Comment    BackupPrimaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    BackupPrimaryCylinderLoadCellSensitivity    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - BackupSecondaryCylinderLoadCellSensitivity
    [Tags]    functional    skipped
    Comment    BackupSecondaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    BackupSecondaryCylinderLoadCellSensitivity    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - ILCApplicationType
    [Tags]    functional
    Comment    ILCApplicationType is set by the M1M3_Simulator.setServerID keyword, ilcAppType parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Verify Rational Value    ILCApplicationType    ${faidata.ILCApplicationType[${index}]}    ${2}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - ILCUniqueId
    [Tags]    functional
    Comment    ILCUniqueId is configured in the M1M3 Control software settings.
    Verify Force Actuator Info    ILCUniqueId    ${forceActuatorTableIDIndex}

Verify Force Actuator Info Event - ILCSelectedOptions
    [Tags]    functional
    Comment    ILCSelectedOptions is set by the M1M3_Simulator.setServerID keyword, ilcSelectedOptions parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword If    ${index} <= ${16}    Set Test Variable    ${value}    ${0}
    \    Run Keyword If    ${index} >= ${16}    Set Test Variable    ${value}    ${2}
    \    Verify Rational Value    ILCSelectedOptions    ${faidata.ILCSelectedOptions[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MainPrimaryCylinderCoefficient
    [Tags]    functional    skipped
    Comment    MainPrimaryCylinderCoefficient is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MainPrimaryCylinderCoefficient    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - MainSecondaryCylinderCoefficient
    [Tags]    functional    skipped
    Comment    MainSecondaryCylinderCoefficient is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MainSecondaryCylinderCoefficient    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - MainPrimaryCylinderLoadCellOffset
    [Tags]    functional    skipped
    Comment    MainPrimaryCylinderLoadCellOffset is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MainPrimaryCylinderLoadCellOffset    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - MainSecondaryCylinderLoadCellOffset
    [Tags]    functional    skipped
    Comment    MainSecondaryCylinderLoadCellOffset is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MainSecondaryCylinderLoadCellOffset    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - MainPrimaryCylinderLoadCellSensitivity
    [Tags]    functional    skipped
    Comment    MainPrimaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MainPrimaryCylinderLoadCellSensitivity    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - MainSecondaryCylinderLoadCellSensitivity
    [Tags]    functional    skipped
    Comment    MainSecondaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MainSecondaryCylinderLoadCellSensitivity    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - MajorRevision
    [Tags]    functional
    Comment    MajorRevision is set by the M1M3_Simulator.YYYYYYY keyword, majorRev parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Verify Rational Value    MajorRevision    ${faidata.MajorRevision[${index}]}    ${8}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MinorRevision
    [Tags]    functional
    Comment    MinorRevision is set by the M1M3_Simulator.YYYYYYY keyword, minorRev parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Verify Rational Value    MinorRevision    ${faidata.MinorRevision[${index}]}    ${2}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineFirmwareType
    [Tags]    functional
    Comment    MezzanineFirmwareType is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, firmwareType parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Verify Rational Value    MezzanineFirmwareType    ${faidata.MezzanineFirmwareType[${index}]}    ${52}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineMajorRevision
    [Tags]    functional
    Comment    MezzanineMajorRevision is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, firmwareVersion parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Verify Rational Value    MezzanineMajorRevision    ${faidata.MezzanineMajorRevision[${index}]}    ${8}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineMinorRevision
    [Tags]    functional
    Comment    MezzanineMinorRevision is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, firmwareVersion parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Verify Rational Value    MinorRevision    ${faidata.MinorRevision[${index}]}    ${2}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineUniqueId
    [Tags]    functional
    Comment    MezzanineUniqueId is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, dcaUniqueId parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${mezzID}=    Evaluate    ${row[1]} + ${1000}
    \    Verify Rational Value    MezzanineUniqueId    ${faidata.MezzanineUniqueId[${index}]}    ${mezzID}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzaninePrimaryCylinderGain
    [Tags]    functional    skipped
    Comment    MezzaninePrimaryCylinderGain is set by the  M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MezzaninePrimaryCylinderGain    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - MezzanineSecondaryCylinderGain
    [Tags]    functional    skipped
    Comment    MezzanineSecondaryCylinderGain is set by the  M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    MezzanineSecondaryCylinderGain    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - ModbusAddress
    [Tags]    functional
    Comment    ModbusAddress is set by the M1M3_Simulator.YYYYYYY keyword, serverAddr parameter.
    Verify Force Actuator Info    ModbusAddress    ${forceActuatorTableAddressIndex}

Verify Force Actuator Info Event - ModbusSubnet
    [Tags]    functional
    Comment    ModbusSubnet is defined on the ILCs; the Force Actuators are on Subnets 1-4, see M1M3_Simulator._subnetToUDPClient.
    Verify Force Actuator Info    ModbusSubnet    ${forceActuatorTableSubnetIndex}

Verify Force Actuator Info Event - NetworkNodeType
    [Tags]    functional
    Comment    NetworkNodeType is set by the M1M3_Simulator.setServerID keyword, NetworkNodeType parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Verify Rational Value    NetworkNodeType    ${faidata.NetworkNodeType[${index}]}    ${2}

Verify Force Actuator Info Event - NetworkNodeOptions
    [Tags]    functional
    Comment    NetworkNodeOptions is set by the  M1M3_Simulator.setServerID keyword, NetworkNodeOptions parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword If    ${index} <= ${16}    Set Test Variable    ${value}    ${0}
    \    Run Keyword If    ${index} >= ${16}    Set Test Variable    ${value}    ${2}
    \    Verify Rational Value    NetworkNodeOptions    ${faidata.NetworkNodeOptions[${index}]}    ${value}

Verify Force Actuator Info Event - ReferenceID
    [Tags]    functional    skipped
    Comment    ReferenceId is set by the M1M3_Simulator.YYYYYYY keyword, uniqueId  parameter.
    Verify Rational Array    ${faidata}    ReferenceId    ${11}    ${12}    ${13}    ${14}    ${15}    ${16}

Verify Force Actuator Info Event - XDataReferenceId
    [Tags]    functional    skipped
    Comment    XDataReferenceId is set by the  M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    XDataReferenceId    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - YDataReferenceId
    [Tags]    functional    skipped
    Comment    YDataReferenceId is set by the  M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    YDataReferenceId    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - ZDataReferenceId
    [Tags]    functional    skipped
    Comment    ZDataReferenceId is set by the  M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    ZDataReferenceId    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - XPosition
    [Tags]    functional    skipped
    Comment    XPosition is configured in the M1M3 Control software settings.
    Verify Force Actuator Info    XPosition    ${forceActuatorTableXPositionIndex}

Verify Force Actuator Info Event - YPosition
    [Tags]    functional    skipped
    Comment    YPosition is configured in the M1M3 Control software settings.
    Verify Force Actuator Info    YPosition    ${forceActuatorTableYPositionIndex}

Verify Force Actuator Info Event - ZPosition
    [Tags]    functional    skipped
    Comment    ZPosition is configured in the M1M3 Control software settings.
    Verify Force Actuator Info   ZPosition    ${forceActuatorTableZPositionIndex}
############ END Verify Force Actuator Info Event Attributes ############

############ BEGIN Verify Force Actuator Data Telemetry Attributes ############

Get Force Actuator Data Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.1}    ${-0.1}    ${-1.1}    ${-2.1}    ${-3.1}    ${-4.1}    ${-5.1}

Verify Force Actuator Data Telemetry - XForce
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${0.2}    ${1.2}    ${2.2}    ${3.2}    ${4.2}    ${5.2}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.1}    ${0.1}    ${1.1}    ${2.1}    ${3.1}    ${4.1}    ${5.1}

Verify Force Actuator Data Telemetry - YForce
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator Data Telemetry - ZForce
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator Data Telemetry - ThermalForcesApplied
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - OffsetForcesApplied
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied
    [Tags]    functional    skipped
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry Attributes ############

############ BEGIN Verify Force Actuator State Event ############

Get Force Actuator State Event
    [Tags]    functional
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}

Verify Force Actuator State Event - ILCState
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - StaticForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${1.5}    ${2.5}    ${3.5}    ${4.5}    ${5.5}    ${6.5}

Verify Force Actuator State Event - ElevationForcesApplied
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${1001}    ${1002}    ${1003}    ${1004}    ${1005}    ${1006}

Verify Force Actuator State Event - AzimuthForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0002}    ${0.0002}    ${0.0002}    ${0.0002}    ${0.0002}    ${0.0002}

Verify Force Actuator State Event - ThermalForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - OffsetForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AccelerationForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - VelocityForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - ActiveOpticForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AberrationForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - BalanceForcesApplied
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - SupportPercentage
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0164}

############ END Verify Force Actuator Data Telemetry ############

Get to Enabled-Parked State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${DetailedParked}

Verify Summary State Event - Parked
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}
    Sleep    300ms    Wait for next outer loop cycle

Verify Force Actuator Info Event - Parked
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Event Force Actuator Info
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - Parked
    [Tags]    functional    skipped
    Set Hardpoint Force And Status    serverAddr=${1}   statusByte=${0}    ssiElevationForcesAppliedValue=${88476}    loadCellForce=${350.924}
    Set Hardpoint Force And Status    ${2}   ${0}    ${4812}    ${559.537}
    Set Hardpoint Force And Status    ${3}   ${0}    ${-34908}    ${-53.534}
    Set Hardpoint Force And Status    ${4}   ${0}    ${-5373}    ${318.700}
    Set Hardpoint Force And Status    ${5}   ${0}    ${16161}    ${-586.714}
    Set Hardpoint Force And Status    ${6}   ${0}    ${-53064}    ${950.831}

Set Hardpoint Pressures - Parked
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${827.8000}    ${-296.9654}    ${855.4093}    ${-896.4723}
    Set Force Actuator DCA Pressure    ${85}    ${24.0640}    ${976.2457}    ${309.1567}    ${58.3888}
    Set Force Actuator DCA Pressure    ${86}    ${439.5877}    ${466.7696}    ${994.3187}    ${459.2541}
    Set Force Actuator DCA Pressure    ${87}    ${-593.9491}    ${981.7325}    ${460.6435}    ${563.6204}
    Set Force Actuator DCA Pressure    ${88}    ${-767.0862}    ${269.1810}    ${-733.5420}    ${-152.2537}
    Set Force Actuator DCA Pressure    ${89}    ${737.8273}    ${-484.2785}    ${-757.4126}    ${210.0550}

############ BEGIN Verify Force Actuator Data Telemetry - PARKED ############

Get Force Actuator Data Telemetry - Parked
    [Tags]    functional
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Parked
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${-67.7013}    ${80.8065}    ${-779.3144}    ${691.2441}    ${261.4818}    ${-553.3500}

Verify Force Actuator Data Telemetry - XForce - Parked
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-32.0664}    ${30.7562}    ${381.2256}    ${-603.9484}    ${-859.8013}    ${-390.1598}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Parked
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${827.8000}    ${24.0640}    ${439.5877}    ${-593.9491}    ${-767.0862}    ${737.8273}

Verify Force Actuator Data Telemetry - YForce - Parked
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${-296.9654}    ${976.2457}    ${466.7696}    ${981.7325}    ${269.1810}    ${-484.2785}

Verify Force Actuator Data Telemetry - ZForce - Parked
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${855.4093}    ${309.1567}    ${994.3187}    ${460.6435}    ${-733.5420}    ${-757.4126}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${-896.4723}    ${58.3888}    ${459.2541}    ${563.6204}    ${-152.2537}    ${210.0550}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - Parked
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - PARKED ############

############ BEGIN Verify Force Actuator State Event - PARKED ############

Get Force Actuator State Event - Parked
    [Tags]    functional
    Comment    Verify Force Actuator State Event is NOT published in Parked.
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Should Not Be True    ${valid}
    Should Be True    ${fasdata.Timestamp} == ${0.0}

Verify Force Actuator State Event - ILCState - Parked
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - Parked
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - StaticForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Force Actuator State Event - ElevationForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Force Actuator State Event - AzimuthForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Force Actuator State Event - ThermalForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - OffsetForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AccelerationForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - VelocityForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - ActiveOpticForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AberrationForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - BalanceForcesApplied - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - SupportPercentage - Parked
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0164}

############ END Verify Force Actuator State Event - PARKED ############

Get to Enabled-Raising State
    [Tags]    functional    skipped
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${DetailedRaising}

Verify Summary State Event - Raising
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - Raising
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - Raising
    [Tags]    functional    skipped
    Comment    Set ElevationForcesApplieds (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Pressures - Raising
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${34.4916}    ${91.6829}    ${99.4094}    ${76.0364}
    Set Force Actuator DCA Pressure    ${85}    ${16.2201}    ${32.3556}    ${11.5845}    ${90.2067}
    Set Force Actuator DCA Pressure    ${86}    ${51.4933}    ${35.8018}    ${19.6609}    ${44.3858}
    Set Force Actuator DCA Pressure    ${87}    ${44.2715}    ${16.7405}    ${64.2425}    ${13.983}
    Set Force Actuator DCA Pressure    ${88}    ${2.9238}    ${97.8798}    ${1.6894}    ${31.9756}
    Set Force Actuator DCA Pressure    ${89}    ${35.6619}    ${53.9305}    ${124.4494}    ${77.4635}

############ BEGIN Verify Force Actuator Data Telemetry - RAISING ############

Get Force Actuator Data Telemetry - Raising
    [Tags]    functional    skipped
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Raising
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${6.2985}    ${-0.1147}    ${3.8486}    ${-6.173}    ${-4.6194}    ${-4.2489}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Raising
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${34.4916}    ${16.2201}    ${51.4933}    ${44.2715}    ${2.9238}    ${35.6619}

Verify Force Actuator Data Telemetry - XForce - Raising
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${3.2604}    ${-3.9019}    ${8.2823}    ${0.1635}    ${-8.9626}    ${1.8729}

Verify Force Actuator Data Telemetry - YForce - Raising
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${91.6829}    ${32.3556}    ${35.8018}    ${16.7405}    ${97.8798}    ${53.9305}

Verify Force Actuator Data Telemetry - ZForce - Raising
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${99.4094}    ${11.5845}    ${19.6609}    ${64.2425}    ${1.6894}    ${124.4494}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${76.0364}    ${90.2067}    ${44.3858}    ${13.983}    ${31.9756}    ${77.4635}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - Raising
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - RAISING ############

############ BEGIN Verify Force Actuator State Event - RAISING ############

Get Force Actuator State Event - Raising 
    [Tags]    functional    skipped
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}

Verify Force Actuator State Event - ILCState - Raising
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - Raising
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - StaticForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - ElevationForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - AzimuthForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}

Verify Force Actuator State Event - ThermalForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - OffsetForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AccelerationForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - VelocityForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - ActiveOpticForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AberrationForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - BalanceForcesApplied - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0}

Verify Force Actuator State Event - SupportPercentage - Raising
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0}

############ END Verify Force Actuator State Event - RAISING ############

Wait Until Raise Completes
    [Tags]    functional    skipped
    Comment    Verify system enters Active State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActive}

Verify Summary State Event - Raise Complete
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - Active
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - Active
    [Tags]    functional    skipped
    Comment    Set ElevationForcesApplieds (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${93738}    ${4812.3538}
    Set Hardpoint Force And Status    ${2}   ${0}    ${-267778}    ${-3943.7594}
    Set Hardpoint Force And Status    ${3}   ${0}    ${-403132}    ${4602.6788}
    Set Hardpoint Force And Status    ${4}   ${0}    ${-102335}    ${3539.1055}
    Set Hardpoint Force And Status    ${5}   ${0}    ${-453498}    ${-1379.5847}
    Set Hardpoint Force And Status    ${6}   ${0}    ${150384}    ${-878.3023}

Set Hardpoint Pressures - Active
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${50.831}    ${31.1756}    ${114.8652}    ${101.3123}
    Set Force Actuator DCA Pressure    ${85}    ${120.2331}    ${41.4072}    ${87.9407}    ${95.6432}
    Set Force Actuator DCA Pressure    ${86}    ${82.262}    ${5.7602}    ${25.5702}    ${87.8503}
    Set Force Actuator DCA Pressure    ${87}    ${111.5033}    ${113.6051}    ${93.0818}    ${60.0473}
    Set Force Actuator DCA Pressure    ${88}    ${91.9502}    ${44.4449}    ${10.4506}    ${119.7166}
    Set Force Actuator DCA Pressure    ${89}    ${48.0472}    ${107.8284}    ${45.1647}    ${71.4285}

############ BEGIN Verify Force Actuator Data Telemetry - ACTIVE ############

Get Force Actuator Data Telemetry - Active
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Active
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${-6.356}    ${-2.4262}    ${5.09}    ${2.9923}    ${3.7093}    ${2.6619}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Active
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${50.831}    ${120.2331}    ${82.262}    ${111.5033}    ${91.9502}    ${48.0472}

Verify Force Actuator Data Telemetry - XForce - Active
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-1.7328}    ${-1.4}    ${0.0076}    ${7.498}    ${-6.7294}    ${-0.1038}

Verify Force Actuator Data Telemetry - YForce - Active
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${31.1756}    ${41.4072}    ${5.7602}    ${113.6051}    ${44.4449}    ${107.8284}

Verify Force Actuator Data Telemetry - ZForce - Active
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${114.8652}    ${87.9407}    ${25.5702}    ${93.0818}    ${10.4506}    ${45.1647}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - Active
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${101.3123}    ${95.6432}    ${87.8503}    ${60.0473}    ${119.7166}    ${71.4285}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Active
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Active
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - Active
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - Active
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - Active
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - Active
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - ACTIVE ############

############ BEGIN Verify Force Actuator State Event - ACTIVE ############

Get Force Actuator State Event - Active 
    [Tags]    functional    skipped
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}
    
Verify Force Actuator State Event - ILCState - Active
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - Active
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Force Actuator State Event - StaticForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${4812.3538}    ${-3943.7594}    ${4602.6788}    ${3539.1055}    ${-1379.5847}    ${-878.3023}

Verify Force Actuator State Event - ElevationForcesApplied - Active
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${93738}    ${-267778}    ${-403132}    ${-102335}    ${-453498}    ${150384}

Verify Force Actuator State Event - AzimuthForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0229}    ${-0.0654}    ${-0.0984}    ${-0.0250}    ${-0.1107}    ${0.0367}

Verify Force Actuator State Event - ThermalForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - OffsetForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AccelerationForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - VelocityForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - ActiveOpticForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AberrationForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0216}
    
Verify Force Actuator State Event - BalanceForcesApplied - Active
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - SupportPercentage - Active
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0164}
    
############ END Verify Force Actuator State Event - ACTIVE ############


Get to Enabled-Lowering State
    [Tags]    functional    skipped
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters Lowering State.
    Verify Detailed State Event    ${DetailedLowering}

Verify Summary State Event - Lowering
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - Lowering
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - Lowering
    [Tags]    functional    skipped
    Comment    Set ElevationForcesApplieds (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Pressures - Lowering
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${123.4892}    ${24.4268}    ${75.2657}    ${72.6079}
    Set Force Actuator DCA Pressure    ${85}    ${27.0135}    ${65.2718}    ${102.1222}    ${44.6229}
    Set Force Actuator DCA Pressure    ${86}    ${44.2858}    ${115.3094}    ${74.7107}    ${61.5088}
    Set Force Actuator DCA Pressure    ${87}    ${51.5121}    ${102.85}    ${47.3032}    ${67.547}
    Set Force Actuator DCA Pressure    ${88}    ${23.4114}    ${97.2484}    ${42.6373}    ${19.0961}
    Set Force Actuator DCA Pressure    ${89}    ${73.439}    ${122.8257}    ${35.761}    ${81.3655}

############ BEGIN Verify Force Actuator Data Telemetry - LOWERING ############

Get Force Actuator Data Telemetry - Lowering
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Lowering
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${-4.0986}    ${-5.6215}    ${9.1817}    ${-5.8255}    ${-5.9124}    ${6.3352}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Lowering
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${123.4892}    ${27.0135}    ${44.2858}    ${51.5121}    ${23.4114}    ${73.439}

Verify Force Actuator Data Telemetry - XForce - Lowering
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-3.8844}    ${-1.0793}    ${-3.5968}    ${-9.6489}    ${-4.1641}    ${9.444}

Verify Force Actuator Data Telemetry - YForce - Lowering
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${24.4268}    ${65.2718}    ${115.3094}    ${102.85}    ${97.2484}    ${122.8257}

Verify Force Actuator Data Telemetry - ZForce - Lowering
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${75.2657}    ${102.1222}    ${74.7107}    ${47.3032}    ${42.6373}    ${35.761}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${72.6079}    ${44.6229}    ${61.5088}    ${67.547}    ${19.0961}    ${81.3655}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - Lowering
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - LOWERING ############

############ BEGIN Verify Force Actuator State Event - LOWERING ############

Get Force Actuator State Event - Lowering 
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}
    
Verify Force Actuator State Event - ILCState - Lowering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - Lowering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Force Actuator State Event - StaticForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - ElevationForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - AzimuthForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}

Verify Force Actuator State Event - ThermalForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - OffsetForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AccelerationForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - VelocityForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - ActiveOpticForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AberrationForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0}
    
Verify Force Actuator State Event - BalanceForcesApplied - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0}

Verify Force Actuator State Event - SupportPercentage - Lowering
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0}
    
############ END Verify Force Actuator State Event - LOWERING ############


Wait Until Lower Completes
    [Tags]    functional    skipped
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParked}

Verify Summary State Event - Lowering Complete
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Get to ParkedEngineering State
    [Tags]    functional    skipped
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${DetailedParkedEngineering}

Verify Summary State Event - ParkedEngineering
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - ParkedEngineering
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - ParkedEngineering
    [Tags]    functional    skipped
    Comment    Set ElevationForcesApplieds (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${192148}    ${-765.5576}
    Set Hardpoint Force And Status    ${2}   ${0}    ${-406285}    ${-4408.2886}
    Set Hardpoint Force And Status    ${3}   ${0}    ${356122}    ${2683.3783}
    Set Hardpoint Force And Status    ${4}   ${0}    ${-254032}    ${1022.9206}
    Set Hardpoint Force And Status    ${5}   ${0}    ${-97329}    ${2359.2162}
    Set Hardpoint Force And Status    ${6}   ${0}    ${369088}    ${4170.0464}

Set Hardpoint Pressures - ParkedEngineering
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${42.6241}    ${50.8365}    ${72.6747}    ${122.1438}
    Set Force Actuator DCA Pressure    ${85}    ${70.8409}    ${61.6645}    ${5.7223}    ${15.8971}
    Set Force Actuator DCA Pressure    ${86}    ${103.4864}    ${86.5637}    ${46.5228}    ${101.2445}
    Set Force Actuator DCA Pressure    ${87}    ${77.7477}    ${3.3414}    ${106.6168}    ${61.3686}
    Set Force Actuator DCA Pressure    ${88}    ${13.7352}    ${96.3002}    ${46.609}    ${4.7147}
    Set Force Actuator DCA Pressure    ${89}    ${27.3488}    ${73.0917}    ${56.3336}    ${44.9574}

############ BEGIN Verify Force Actuator Data Telemetry - PARKEDENGINEERING ############

Get Force Actuator Data Telemetry - ParkedEngineering
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - ParkedEngineering
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${-5.7547}    ${7.5998}    ${-0.6323}    ${1.4139}    ${3.0318}    ${3.4932}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - ParkedEngineering
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${42.6241}    ${70.8409}    ${103.4864}    ${77.7477}    ${13.7352}    ${27.3488}

Verify Force Actuator Data Telemetry - XForce - ParkedEngineering
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-0.9152}    ${-5.3859}    ${-3.6556}    ${-2.7282}    ${5.6386}    ${-5.2086}

Verify Force Actuator Data Telemetry - YForce - ParkedEngineering
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${50.8365}    ${61.6645}    ${86.5637}    ${3.3414}    ${96.3002}    ${73.0917}

Verify Force Actuator Data Telemetry - ZForce - ParkedEngineering
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${72.6747}    ${5.7223}    ${46.5228}    ${106.6168}    ${46.609}    ${56.3336}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${122.1438}    ${15.8971}    ${101.2445}    ${61.3686}    ${4.7147}    ${44.9574}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - ParkedEngineering
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - PARKEDENGINEERING ############

############ BEGIN Verify Force Actuator State Event - PARKEDENGINEERING ############

Get Force Actuator State Event - ParkedEngineering 
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}
    
Verify Force Actuator State Event - ILCState - ParkedEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - ParkedEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Force Actuator State Event - StaticForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${-765.5576}    ${-4408.2886}    ${2683.3783}    ${1022.9206}    ${2359.2162}    ${4170.0464}

Verify Force Actuator State Event - ElevationForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${192148}    ${-406285}    ${356122}    ${-254032}    ${-97329}    ${369088}

Verify Force Actuator State Event - AzimuthForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0469}    ${-0.0992}    ${0.0870}    ${-0.0620}    ${-0.0238}    ${0.0901}

Verify Force Actuator State Event - ThermalForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - OffsetForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AccelerationForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - VelocityForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - ActiveOpticForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AberrationForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0216}
    
Verify Force Actuator State Event - BalanceForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - SupportPercentage - ParkedEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0164}
    
############ END Verify Force Actuator State Event - PARKEDENGINEERING ############


Get to Enabled-RaisingEngineering State
    [Tags]    functional    skipped
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering State.
    Verify Detailed State Event    ${DetailedRaisingEngineering}

Verify Summary State Event - RaisingEngineering
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - RaisingEngineering
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - RaisingEngineering
    [Tags]    functional    skipped
    Comment    Set ElevationForcesApplieds (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Pressures - RaisingEngineering
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${38.1029}    ${59.0454}    ${69.2918}    ${113.1793}
    Set Force Actuator DCA Pressure    ${85}    ${96.8142}    ${79.8555}    ${108.4955}    ${0.4208}
    Set Force Actuator DCA Pressure    ${86}    ${78.9591}    ${104.2031}    ${27.2021}    ${19.5833}
    Set Force Actuator DCA Pressure    ${87}    ${29.5881}    ${79.1663}    ${65.1358}    ${66.3595}
    Set Force Actuator DCA Pressure    ${88}    ${101.6804}    ${45.8824}    ${97.2111}    ${11.4588}
    Set Force Actuator DCA Pressure    ${89}    ${115.2536}    ${48.1822}    ${22.9784}    ${110.1077}

############ BEGIN Verify Force Actuator Data Telemetry - RAISINGENGINEERING ############

Get Force Actuator Data Telemetry - RaisingEngineering
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - RaisingEngineering
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${6.5002}    ${4.3867}    ${-0.6658}    ${2.8957}    ${-4.0986}    ${-8.0855}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - RaisingEngineering
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${38.1029}    ${96.8142}    ${78.9591}    ${29.5881}    ${101.6804}    ${115.2536}

Verify Force Actuator Data Telemetry - XForce - RaisingEngineering
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-2.2664}    ${-0.4983}    ${-4.9625}    ${6.1291}    ${0.1223}    ${-5.8437}

Verify Force Actuator Data Telemetry - YForce - RaisingEngineering
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${59.0454}    ${79.8555}    ${104.2031}    ${79.1663}    ${45.8824}    ${48.1822}

Verify Force Actuator Data Telemetry - ZForce - RaisingEngineering
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${69.2918}    ${108.4955}    ${27.2021}    ${65.1358}    ${97.2111}    ${22.9784}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${113.1793}    ${0.4208}    ${19.5833}    ${66.3595}    ${11.4588}    ${110.1077}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - RaisingEngineering
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - RAISINGENGINEERING ############

############ BEGIN Verify Force Actuator State Event - RAISINGENGINEERING ############

Get Force Actuator State Event - RaisingEngineering 
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}
    
Verify Force Actuator State Event - ILCState - RaisingEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - RaisingEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Force Actuator State Event - StaticForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - ElevationForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - AzimuthForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}

Verify Force Actuator State Event - ThermalForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - OffsetForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AccelerationForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - VelocityForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - ActiveOpticForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AberrationForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0}
    
Verify Force Actuator State Event - BalanceForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0}

Verify Force Actuator State Event - SupportPercentage - RaisingEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0}
    
############ END Verify Force Actuator State Event - RAISING ############


Wait Until Engineering Raise Completes
    [Tags]    functional    skipped
    Comment    Verify system enters ActiveEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActiveEngineering}

Verify Summary State Event - RaisingEngineering Complete
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - ActiveEngineering
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - ActiveEngineering
    [Tags]    functional    skipped
    Comment    Set ElevationForcesApplieds (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${-37641}    ${1863.7192}
    Set Hardpoint Force And Status    ${2}   ${0}    ${163077}    ${3828.2121}
    Set Hardpoint Force And Status    ${3}   ${0}    ${26358}    ${190.6504}
    Set Hardpoint Force And Status    ${4}   ${0}    ${325099}    ${1581.8369}
    Set Hardpoint Force And Status    ${5}   ${0}    ${-162594}    ${-264.2161}
    Set Hardpoint Force And Status    ${6}   ${0}    ${-417537}    ${1835.9168}

Set Hardpoint Pressures - ActiveEngineering
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${2.9479}    ${31.8313}    ${121.2799}    ${18.352}
    Set Force Actuator DCA Pressure    ${85}    ${94.9948}    ${105.0573}    ${35.3427}    ${120.0051}
    Set Force Actuator DCA Pressure    ${86}    ${2.0569}    ${33.7693}    ${51.5575}    ${72.4781}
    Set Force Actuator DCA Pressure    ${87}    ${62.0459}    ${81.5766}    ${118.9956}    ${99.2511}
    Set Force Actuator DCA Pressure    ${88}    ${22.2302}    ${55.9627}    ${98.9298}    ${55.4351}
    Set Force Actuator DCA Pressure    ${89}    ${60.5436}    ${9.5247}    ${72.1312}    ${12.7859}

############ BEGIN Verify Force Actuator Data Telemetry - ACTIVEENGINEERING ############

Get Force Actuator Data Telemetry - ActiveEngineering
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - ActiveEngineering
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${-7.1027}    ${4.9707}    ${-5.3761}    ${3.0922}    ${3.1161}    ${7.2899}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - ActiveEngineering
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${2.9479}    ${94.9948}    ${2.0569}    ${62.0459}    ${22.2302}    ${60.5436}

Verify Force Actuator Data Telemetry - XForce - ActiveEngineering
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-3.3515}    ${-4.0261}    ${2.4002}    ${4.856}    ${6.8209}    ${-2.8102}

Verify Force Actuator Data Telemetry - YForce - ActiveEngineering
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${31.8313}    ${105.0573}    ${33.7693}    ${81.5766}    ${55.9627}    ${9.5247}

Verify Force Actuator Data Telemetry - ZForce - ActiveEngineering
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${121.2799}    ${35.3427}    ${51.5575}    ${118.9956}    ${98.9298}    ${72.1312}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${18.352}    ${120.0051}    ${72.4781}    ${99.2511}    ${55.4351}    ${12.7859}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - ActiveEngineering
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - ACTIVEENGINEERING ############

############ BEGIN Verify Force Actuator State Event - ACTIVEENGINEERING ############

Get Force Actuator State Event - ActiveEngineering 
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}
    
Verify Force Actuator State Event - ILCState - ActiveEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - ActiveEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Force Actuator State Event - StaticForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${1863.7192}    ${3828.2121}    ${190.6504}    ${1581.8369}    ${-264.2161}    ${1835.9168}

Verify Force Actuator State Event - ElevationForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${-37641}    ${163077}    ${26358}    ${325099}    ${-162594}    ${-417537}

Verify Force Actuator State Event - AzimuthForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${-0.0092}    ${0.0398}    ${0.0064}    ${0.0794}    ${-0.0397}    ${-0.1020}

Verify Force Actuator State Event - ThermalForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - OffsetForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AccelerationForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - VelocityForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - ActiveOpticForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - AberrationForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0216}
    
Verify Force Actuator State Event - BalanceForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0216}

Verify Force Actuator State Event - SupportPercentage - ActiveEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0164}
    
############ END Verify Force Actuator State Event - ACTIVEENGINEERING ############

Get to Enabled-LoweringEngineering State
    [Tags]    functional    skipped
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters LoweringEngineering State.
    Verify Detailed State Event    ${DetailedLoweringEngineering}

Verify Summary State Event - LoweringEngineering
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - LoweringEngineering
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - LoweringEngineering
    [Tags]    functional    skipped
    Comment    Set ElevationForcesApplieds (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Pressures - LoweringEngineering
    [Tags]    functional    skipped
    Set Force Actuator DCA Pressure    ${84}    ${43.7634}    ${2.5499}    ${4.3249}    ${30.9403}
    Set Force Actuator DCA Pressure    ${85}    ${101.6443}    ${41.9807}    ${12.0199}    ${56.7542}
    Set Force Actuator DCA Pressure    ${86}    ${54.1675}    ${59.4506}    ${10.943}    ${24.5752}
    Set Force Actuator DCA Pressure    ${87}    ${53.2244}    ${53.7893}    ${60.0778}    ${97.4168}
    Set Force Actuator DCA Pressure    ${88}    ${104.1298}    ${76.6312}    ${22.548}    ${77.5772}
    Set Force Actuator DCA Pressure    ${89}    ${48.1102}    ${97.9469}    ${71.447}    ${68.1742}

############ BEGIN Verify Force Actuator Data Telemetry - LOWERINGENGINEERING ############

Get Force Actuator Data Telemetry - LoweringEngineering
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - LoweringEngineering
    [Tags]    functional    skipped
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setHardpointXForce keyword, lvdt1 parameter.
    Verify Irrational Array    ${fadata}    PrimaryCylinderForce    ${0.001}    ${-3.2376}    ${-6.7826}    ${-9.9491}    ${1.9663}    ${-7.371}    ${9.5657}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - LoweringEngineering
    [Tags]    functional    skipped
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure1AxialPush parameter.
    Verify Irrational Array    ${fadata}    SecondaryCylinderForce    ${0.001}    ${43.7634}    ${101.6443}    ${54.1675}    ${53.2244}    ${104.1298}    ${48.1102}

Verify Force Actuator Data Telemetry - XForce - LoweringEngineering
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-1.4411}    ${3.0871}    ${-6.4417}    ${9.0157}    ${-0.1022}    ${1.1736}

Verify Force Actuator Data Telemetry - YForce - LoweringEngineering
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${2.5499}    ${41.9807}    ${59.4506}    ${53.7893}    ${76.6312}    ${97.9469}

Verify Force Actuator Data Telemetry - ZForce - LoweringEngineering
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${4.3249}    ${12.0199}    ${10.943}    ${60.0778}    ${22.548}    ${71.447}

Verify Force Actuator Data Telemetry - ThermalForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ThermalForcesApplied    ${0.001}    ${30.9403}    ${56.7542}    ${24.5752}    ${97.4168}    ${77.5772}    ${68.1742}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AccelerationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - VelocityForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    VelocityForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    VelocityForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - ActiveOpticForcesApplied - LoweringEngineering
    [Tags]    functional    skipped 
    Comment    ActiveOpticForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    ActiveOpticForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AberrationForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    AberrationForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    AberrationForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - BalanceForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    ThermalForcesApplied is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}


############ END Verify Force Actuator Data Telemetry - LOWERINGENGINEERING ############

############ BEGIN Verify Force Actuator State Event - LOWERINGENGINEERING ############
    
Get Force Actuator State Event - LoweringEngineering
    [Tags]    functional    skipped
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Set Suite Variable    ${fasdata}
    Should Be True    ${valid}

Verify Force Actuator State Event - ILCState - LoweringEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ILCState    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - SlewFlag - LoweringEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    SlewFlag    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Force Actuator State Event - StaticForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    StaticForcesApplied    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - ElevationForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Rational Array    ${fasdata}    ElevationForcesApplied    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator State Event - AzimuthForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Array    ${fasdata}    AzimuthForcesApplied    ${0.001}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}    ${0.0}

Verify Force Actuator State Event - ThermalForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ThermalForcesApplied    ${fasdata.ThermalForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - OffsetForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    OffsetForcesApplied    ${fasdata.OffsetForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AccelerationForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AccelerationForcesApplied    ${fasdata.AccelerationForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - VelocityForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    VelocityForcesApplied    ${fasdata.VelocityForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - ActiveOpticForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    ActiveOpticForcesApplied    ${fasdata.ActiveOpticForcesApplied}    ${0.001}    ${0.0}

Verify Force Actuator State Event - AberrationForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    AberrationForcesApplied    ${fasdata.AberrationForcesApplied}    ${0.001}    ${0.0}
    
Verify Force Actuator State Event - BalanceForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    BalanceForcesApplied    ${fasdata.ForceMagnitude}    ${0.001}    ${0.0}

Verify Force Actuator State Event - SupportPercentage - LoweringEngineering
    [Tags]    functional    skipped
    Verify Irrational Value    SupportPercentage    ${fasdata.SupportPercentage}    ${0.001}    ${0.0}
    
############ END Verify Force Actuator State Event - LOWERINGENGINEERING ############

Wait Until Engineering Lower Completes
    [Tags]    functional    skipped
    Comment    Verify system enters ParkedEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParkedEngineering}

Verify Summary State Event - LoweringEngineering Complete
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Get to Disabled State - Cleanup
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    Verify Detailed State Event    ${DetailedDisabled}

Verify Summary State Event - Disabled
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryDisabled}

Verify Force Actuator Info Event - Disabled from Enabled
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get to Standby State - Cleanup
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    Verify Detailed State Event    ${DetailedStandby}

Verify Summary State Event - Standby
    [Tags]    functional    skipped
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryStandby}

Verify Force Actuator Info Event - Standby
    [Tags]    functional    skipped
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Verify Force Actuator Data Telemetry - Standby
    [Tags]    functional    skipped
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Should Be True    ${valid}
    Comment    Verify Force Actuator Data Telemetry is NOT published in Standby.
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Should Not Be True    ${valid}

Verify Force Actuator State Event - Standby
    [Tags]    functional    skipped
    Comment    Verify Force Actuator State Event is NOT published in Standby.
    ${valid}    ${fasdata}=    Get Force Actuator State Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

*** Keywords ***
Verify Force Actuator Info
    [Arguments]    ${payload}    ${dataIndex}
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    ${payload}    ${faidata.${payload}[${index}]}    ${row[${dataIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}

Get Force Actuator Info Event
    Comment    Verify system publishes the Force Actuator Info Event.
    ${valid}    ${data}=    Get Event Force Actuator Info
    Report Force Actuator Info Event
    [Return]    ${valid}    ${data}

Report Force Actuator Info Event
    [Arguments]    ${data}
    Comment    Log the Force Actuator Info Event data.
    Log    ${data.Timestamp}
    Log    ${data.ActuatorType}
    Log    ${data.ActuatorOrientation}
    Log    ${data.ADCScanRate}
    Log    ${data.BackupPrimaryCylinderCoefficient}
    Log    ${data.BackupSecondaryCylinderCoefficient}
    Log    ${data.BackupPrimaryCylinderLoadCellOffset}
    Log    ${data.BackupSecondaryCylinderLoadCellOffset}
    Log    ${data.BackupPrimaryCylinderLoadCellSensitivity}
    Log    ${data.BackupSecondaryCylinderLoadCellSensitivity}
    Log    ${data.ILCApplicationType}
    Log    ${data.ILCUniqueId}
    Log    ${data.ILCSelectedOptions}
    Log    ${data.MainPrimaryCylinderCoefficient}
    Log    ${data.MainSecondaryCylinderCoefficient}
    Log    ${data.MainPrimaryCylinderLoadCellOffset}
    Log    ${data.MainSecondaryCylinderLoadCellOffset}
    Log    ${data.MainPrimaryCylinderLoadCellSensitivity}
    Log    ${data.MainSecondaryCylinderLoadCellSensitivity}
    Log    ${data.MajorRevision}
    Log    ${data.MezzaninePrimaryCylinderGain}
    Log    ${data.MezzanineSecondaryCylinderGain}
    Log    ${data.MezzanineFirmwareType}
    Log    ${data.MezzanineFirmwareType}
    Log    ${data.MezzanineMajorRevision}
    Log    ${data.MezzanineMinorRevision}
    Log    ${data.MezzanineUniqueId}
    Log    ${data.MinorRevision}
    Log    ${data.ModbusAddress}
    Log    ${data.ModbusSubnet}
    Log    ${data.NetworkNodeType}
    Log    ${data.NetworkNodeOptions}
    Log    ${data.ReferenceId}
    Log    ${data.XDataReferenceId}
    Log    ${data.YDataReferenceId}
    Log    ${data.ZDataReferenceId}
    Log    ${data.XPosition}
    Log    ${data.YPosition}
    Log    ${data.ZPosition}

Get Force Actuator State Event
    Comment    Verify system publishes the Force Actuator State Event.
    ${valid}    ${data}=    Get Event Force Actuator State
    Log    ${data.Timestamp}
    Log    ${data.ILCState}
    Log    ${data.SlewFlag}
    Log    ${data.StaticForcesApplied}
    Log    ${data.ElevationForcesApplied}
    Log    ${data.AzimuthForcesApplied}
    Log    ${data.ThermalForcesApplied}
    Log    ${data.OffsetForcesApplied}
    Log    ${data.AccelerationForcesApplied}
    Log    ${data.VelocityForcesApplied}
    Log    ${data.ActiveOpticForcesApplied}
    Log    ${data.AberrationForcesApplied}
    Log    ${data.BalanceForcesApplied}
    Log    ${data.SupportPercentage}
    [Return]    ${valid}    ${data}

Get Force Actuator Data Telemetry
    Comment    Verify system publishes Force Actuator Data Telemetry.
    ${valid}    ${data}=    Get Sample Force Actuator Data
    Log    ${data.Timestamp}
    Log    ${data.PrimaryCylinderForce}
    Log    ${data.SecondaryCylinderForce}
    Log    ${data.XForce}
    Log    ${data.YForce}
    Log    ${data.ZForce}
    Log    ${data.Fx}
    Log    ${data.Fy}
    Log    ${data.Fz}
    Log    ${data.Mx}
    Log    ${data.My}
    Log    ${data.Mz}
    Log    ${data.ForceMagnitude}
    [Return]    ${valid}    ${data}
