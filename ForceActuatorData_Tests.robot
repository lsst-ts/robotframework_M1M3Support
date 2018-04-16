*** Settings ***
Documentation    M1M3 Force Actuator Telemetry tests.
Force Tags    
Suite Setup    Run Keywords    M1M3_Simulator.Set to Defaults    AND    M1M3_SAL.Flush Force Actuator Info
Suite Teardown    M1M3_Simulator.Set to Defaults
Library		String
Library		DateTime
Library		Library/M1M3_Simulator.py
Resource	common.robot
Resource	Global_Vars.robot
Variables	Library/M1M3_ReferenceData.py
Library		Library/M1M3_SAL.py

*** Variables ***
${tolerance}    ${0.001}

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
    \    ${value}=    Set Variable If    '${row[${forceActuatorTableTypeIndex}]}' == 'SAA'    ${SAA}    ${DAA}
    \    Log Many    Attribute: ActuatorType    Value: ${faidata.ActuatorType[${index}]}    Expected Value: ${value}
    \    Run Keyword and Continue on Failure    Should Be Equal As Numbers    ${faidata.ActuatorType[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - ActuatorOrientation
    [Tags]    functional
    Comment    ActuatorOrientation is configured in the M1M3 Control software settings. 
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Set Variable If    '${row[${forceActuatorTableOrientationIndex}]}' == 'NA'    ${NA}
    \    ...    '${row[${forceActuatorTableOrientationIndex}]}' == '+Y'    ${PosY}
    \    ...    '${row[${forceActuatorTableOrientationIndex}]}' == '-Y'    ${NegY}
    \    ...    '${row[${forceActuatorTableOrientationIndex}]}' == '+X'    ${PosX}
    \    ...    '${row[${forceActuatorTableOrientationIndex}]}' == '-X'    ${NegX}
    \    Log Many    Attribute: ActuatorOrientation    Value: ${faidata.ActuatorOrientation[${index}]}    Expected Value: ${value}
    \    Run Keyword and Continue on Failure    Should Be Equal As Numbers    ${faidata.ActuatorOrientation[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - ADCScanRate
    [Tags]    functional
    Comment    ADCScanRate is set by the M1M3_Simulator.setAdcSampleRate keyword, scanRateCode parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    ADCScanRate    ${faidata.ADCScanRate[${index}]}    ${8}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - BackupPrimaryCylinderCoefficient
    [Tags]    functional
    Comment    BackupPrimaryCylinderCoefficient is set by the M1M3_Simulator.setCalibrationData keyword, backupAdcCalibration1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} + ${1}
    \    Run Keyword and Continue on Failure    Verify Rational Value    BackupPrimaryCylinderCoefficient    ${faidata.BackupPrimaryCylinderCoefficient[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - BackupSecondaryCylinderCoefficient
    [Tags]    functional
    Comment    BackupSecondaryCylinderCoefficient is set by the M1M3_Simulator.setCalibrationData keyword, backupAdcCalibration1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} + ${1}
    \    Run Keyword and Continue on Failure    Verify Rational Value    BackupSecondaryCylinderCoefficient    ${faidata.BackupSecondaryCylinderCoefficient[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - BackupPrimaryCylinderLoadCellOffset
    [Tags]    functional
    Comment    BackupPrimaryCylinderLoadCellOffset is set by the M1M3_Simulator.setCalibrationData keyword, backupSensorOffset1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} + ${100}
    \    Run Keyword and Continue on Failure    Verify Rational Value    BackupPrimaryCylinderLoadCellOffset    ${faidata.BackupPrimaryCylinderLoadCellOffset[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - BackupSecondaryCylinderLoadCellOffset
    [Tags]    functional
    Comment    BackupSecondaryCylinderLoadCellOffset is set by the M1M3_Simulator.setCalibrationData keyword, backupSensorOffset2 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} + ${101}
    \    Run Keyword and Continue on Failure    Verify Rational Value    BackupSecondaryCylinderLoadCellOffset    ${faidata.BackupSecondaryCylinderLoadCellOffset[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - BackupPrimaryCylinderLoadCellSensitivity
    [Tags]    functional
    Comment    BackupPrimaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.setCalibrationData keyword, backupSensorSensitivity1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} + ${1000}
    \    Run Keyword and Continue on Failure    Verify Rational Value    BackupPrimaryCylinderLoadCellSensitivity    ${faidata.BackupPrimaryCylinderLoadCellSensitivity[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - BackupSecondaryCylinderLoadCellSensitivity
    [Tags]    functional
    Comment    BackupSecondaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.setCalibrationData keyword, backupSensorSensitivity2 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} + ${1001}
    \    Run Keyword and Continue on Failure    Verify Rational Value    BackupSecondaryCylinderLoadCellSensitivity    ${faidata.BackupSecondaryCylinderLoadCellSensitivity[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - ILCApplicationType
    [Tags]    functional
    Comment    ILCApplicationType is set by the M1M3_Simulator.setServerID keyword, ilcAppType parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    ILCApplicationType    ${faidata.ILCApplicationType[${index}]}    ${2}
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
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Test Variable    ${value}    ${0}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} >= ${16}    Set Test Variable    ${value}    ${2}
    \    Run Keyword and Continue on Failure    Verify Rational Value    ILCSelectedOptions    ${faidata.ILCSelectedOptions[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MainPrimaryCylinderCoefficient
    [Tags]    functional
    Comment    MainPrimaryCylinderCoefficient is set by the M1M3_Simulator.setCalibrationData keyword, mainAdcCalibration1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIndexIndex}]} + ${0}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MainPrimaryCylinderCoefficient    ${faidata.MainPrimaryCylinderCoefficient[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MainSecondaryCylinderCoefficient
    [Tags]    functional
    Comment    MainSecondaryCylinderCoefficient is set by the M1M3_Simulator.setCalibrationData keyword, mainAdcCalibration1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIndexIndex}]} + ${0}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MainSecondaryCylinderCoefficient    ${faidata.MainSecondaryCylinderCoefficient[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MainPrimaryCylinderLoadCellOffset
    [Tags]    functional
    Comment    MainPrimaryCylinderLoadCellOffset is set by the M1M3_Simulator.setCalibrationData keyword, mainSensorOffset1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIndexIndex}]} + ${100}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MainPrimaryCylinderLoadCellOffset    ${faidata.MainPrimaryCylinderLoadCellOffset[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MainSecondaryCylinderLoadCellOffset
    [Tags]    functional
    Comment    MainSecondaryCylinderLoadCellOffset is set by the M1M3_Simulator.setCalibrationData keyword, mainSensorOffset2 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIndexIndex}]} + ${101}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MainSecondaryCylinderLoadCellOffset    ${faidata.MainSecondaryCylinderLoadCellOffset[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MainPrimaryCylinderLoadCellSensitivity
    [Tags]    functional
    Comment    MainPrimaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.setCalibrationData keyword, mainSensorSensitivity1 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIndexIndex}]} + ${1000}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MainPrimaryCylinderLoadCellSensitivity    ${faidata.MainPrimaryCylinderLoadCellSensitivity[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MainSecondaryCylinderLoadCellSensitivity
    [Tags]    functional
    Comment    MainSecondaryCylinderLoadCellSensitivity is set by the M1M3_Simulator.setCalibrationData keyword, mainSensorSensitivity2 parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIndexIndex}]} + ${1001}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MainSecondaryCylinderLoadCellSensitivity    ${faidata.MainSecondaryCylinderLoadCellSensitivity[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MajorRevision
    [Tags]    functional
    Comment    MajorRevision is set by the M1M3_Simulator.setServerID keyword, majorRev parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MajorRevision    ${faidata.MajorRevision[${index}]}    ${8}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MinorRevision
    [Tags]    functional
    Comment    MinorRevision is set by the M1M3_Simulator.setServerID keyword, minorRev parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MinorRevision    ${faidata.MinorRevision[${index}]}    ${2}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineFirmwareType
    [Tags]    functional
    Comment    MezzanineFirmwareType is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, firmwareType parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MezzanineFirmwareType    ${faidata.MezzanineFirmwareType[${index}]}    ${52}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineMajorRevision
    [Tags]    functional
    Comment    MezzanineMajorRevision is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, firmwareVersion parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MezzanineMajorRevision    ${faidata.MezzanineMajorRevision[${index}]}    ${8}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineMinorRevision
    [Tags]    functional
    Comment    MezzanineMinorRevision is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, firmwareVersion parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MinorRevision    ${faidata.MinorRevision[${index}]}    ${2}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineUniqueId
    [Tags]    functional
    Comment    MezzanineUniqueId is set by the M1M3_Simulator.setHardpointMonitorMezzanineID keyword, dcaUniqueId parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${mezzID}=    Evaluate    ${row[1]} + ${1000}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MezzanineUniqueId    ${faidata.MezzanineUniqueId[${index}]}    ${mezzID}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzaninePrimaryCylinderGain
    [Tags]    functional
    Comment    MezzaninePrimaryCylinderGain is set by the M1M3_Simulator.setBoostValueDcaGains keyword, axialBoostValveGain parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MezzaninePrimaryCylinderGain    ${faidata.MezzaninePrimaryCylinderGain[${index}]}    ${1.0}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - MezzanineSecondaryCylinderGain
    [Tags]    functional
    Comment    MezzanineSecondaryCylinderGain is set by the M1M3_Simulator.setBoostValueDcaGains keyword, lateralBoostValveGain parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    MezzanineSecondaryCylinderGain    ${faidata.MezzanineSecondaryCylinderGain[${index}]}    ${1.0}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - ModbusAddress
    [Tags]    functional
    Comment    ModbusAddress is defined on the ILCs.  See the forceActuatorTable in M1M3_ReferenceData.py.
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
    \    Run Keyword and Continue on Failure    Verify Rational Value    NetworkNodeType    ${faidata.NetworkNodeType[${index}]}    ${2}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - NetworkNodeOptions
    [Tags]    functional
    Comment    NetworkNodeOptions is set by the M1M3_Simulator.setServerID keyword, NetworkNodeOptions parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Test Variable    ${value}    ${0}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Test Variable    ${value}    ${2}
    \    Run Keyword and Continue on Failure    Verify Rational Value    NetworkNodeOptions    ${faidata.NetworkNodeOptions[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - ReferenceID
    [Tags]    functional
    Comment    ReferenceId is set by the M1M3_Simulator.YYYYYYY keyword, uniqueId  parameter.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    ReferenceId    ${faidata.ReferenceId[${index}]}    ${row[${forceActuatorTableIDIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - XDataReferenceId
    [Tags]    functional    skipped
    Comment    XDataReferenceId is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    XDataReferenceId    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - YDataReferenceId
    [Tags]    functional    skipped
    Comment    YDataReferenceId is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    YDataReferenceId    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - ZDataReferenceId
    [Tags]    functional    skipped
    Comment    ZDataReferenceId is set by the M1M3_Simulator.YYYYYYY keyword, ZZZZZZZZ parameter.
    Verify Rational Array    ${faidata}    ZDataReferenceId    ${A}    ${A}    ${A}    ${A}    ${A}    ${A}

Verify Force Actuator Info Event - XPosition
    [Tags]    functional
    Comment    XPosition is configured in the M1M3 Control software settings.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    XPosition    ${faidata.XPosition[${index}]}    ${0.0001}    ${row[${forceActuatorTableXPositionIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - YPosition
    [Tags]    functional
    Comment    YPosition is configured in the M1M3 Control software settings.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    YPosition    ${faidata.YPosition[${index}]}    ${0.0001}    ${row[${forceActuatorTableYPositionIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Info Event - ZPosition
    [Tags]    functional
    Comment    ZPosition is configured in the M1M3 Control software settings.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    ZPosition    ${faidata.ZPosition[${index}]}    ${0.0001}    ${row[${forceActuatorTableZPositionIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}

############ END Verify Force Actuator Info Event Attributes ############

############ BEGIN Verify Force Actuator Data Telemetry Attributes ############

Get Force Actuator Data Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR 
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Run Keyword and Continue on Failure    Verify Rational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${row[${forceActuatorTableIDIndex}]}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} - ${1}
    \    Run Keyword and Continue on Failure    Verify Rational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - XForce
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${0.2}    ${1.2}    ${2.2}    ${3.2}    ${4.2}    ${5.2}

Verify Force Actuator Data Telemetry - YForce
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator Data Telemetry - ZForce
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Force Actuator Data Telemetry - Fx
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - OffsetForcesApplied
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry Attributes ############

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
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} * ${-1}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${value}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${value}    lateralLoadCellForce=${index}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - PARKED ############

Get Force Actuator Data Telemetry - Parked
    [Tags]    functional
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Parked
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} * ${-1}
    \    Run Keyword and Continue on Failure    Verify Rational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Parked
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIndexIndex}]} + ${0}
    \    Run Keyword and Continue on Failure    Verify Rational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - XForce - Parked
    [Tags]    functional    skipped
    Comment    XForce is set by the M1M3_Simulator.setHardpointAzimuthForcesAppliedLVDT keyword, lvdt2 parameter.
    Verify Irrational Array    ${fadata}    XForce    ${0.001}    ${-32.0664}    ${30.7562}    ${381.2256}    ${-603.9484}    ${-859.8013}    ${-390.1598}

Verify Force Actuator Data Telemetry - YForce - Parked
    [Tags]    functional    skipped
    Comment    YForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure2AxialPull parameter.
    Verify Irrational Array    ${fadata}    YForce    ${0.001}    ${-296.9654}    ${976.2457}    ${466.7696}    ${981.7325}    ${269.1810}    ${-484.2785}

Verify Force Actuator Data Telemetry - ZForce - Parked
    [Tags]    functional    skipped
    Comment    ZForce is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure3LateralPull parameter.
    Verify Irrational Array    ${fadata}    ZForce    ${0.001}    ${855.4093}    ${309.1567}    ${994.3187}    ${460.6435}    ${-733.5420}    ${-757.4126}

Verify Force Actuator Data Telemetry - Fx - Parked
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${-896.4723}    ${58.3888}    ${459.2541}    ${563.6204}    ${-152.2537}    ${210.0550}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Parked
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - PARKED ############

Get to Enabled-Raising State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${DetailedRaising}

Verify Summary State Event - Raising
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - Raising
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - Raising
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${LoadCellForce}=    Evaluate    ${2500} + ${2500}
    \    ${AxialLoadCellForce}=    Evaluate    ${5000} + ${2500}
    \    ${LateralLoadCellForce}=    Evaluate    ${2500} + ${0}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${LoadCellForce}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${AxialLoadCellForce}    lateralLoadCellForce=${LateralLoadCellForce}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - RAISING ############

Get Force Actuator Data Telemetry - Raising
    [Tags]    functional
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Raising
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Set Variable If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    ${5000}    ${7500}
    \    Run Keyword and Continue on Failure    Verify Rational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Raising
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Evaluate    ${2500}+ ${0}
    \    Run Keyword and Continue on Failure    Verify Rational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

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

Verify Force Actuator Data Telemetry - Fx - Raising
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${76.0364}    ${90.2067}    ${44.3858}    ${13.983}    ${31.9756}    ${77.4635}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Raising
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - RAISING ############

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActive}

Verify Summary State Event - Raise Complete
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - Active
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - Active
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${-4000} + ${index}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${value}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${value}    lateralLoadCellForce=${value}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - ACTIVE ############

Get Force Actuator Data Telemetry - Active
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Active
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${-4000} + ${index}
    \    Run Keyword and Continue on Failure    Verify Rational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Active
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Evaluate    ${-4000}+ ${row[${forceActuatorTableIndexIndex}]}
    \    Run Keyword and Continue on Failure    Verify Rational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

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

Verify Force Actuator Data Telemetry - Fx - Active
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${101.3123}    ${95.6432}    ${87.8503}    ${60.0473}    ${119.7166}    ${71.4285}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Active
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Active
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - ACTIVE ############

Get to Enabled-Lowering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters Lowering State.
    Verify Detailed State Event    ${DetailedLowering}

Verify Summary State Event - Lowering
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - Lowering
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - Lowering
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Set Variable    ${0}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${value}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${value}    lateralLoadCellForce=${value}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - LOWERING ############

Get Force Actuator Data Telemetry - Lowering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - Lowering
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Set Variable    ${0}
    \    Run Keyword and Continue on Failure    Verify Rational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - Lowering
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Set Variable    ${0}
    \    Run Keyword and Continue on Failure    Verify Rational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

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

Verify Force Actuator Data Telemetry - Fx - Lowering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${72.6079}    ${44.6229}    ${61.5088}    ${67.547}    ${19.0961}    ${81.3655}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - Lowering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - LOWERING ############

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParked}

Verify Summary State Event - Lowering Complete
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Get to ParkedEngineering State
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${DetailedParkedEngineering}

Verify Summary State Event - ParkedEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - ParkedEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - ParkedEngineering
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    (${index} + ${1}) * ${3.14159}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${value}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${value}    lateralLoadCellForce=${value}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - PARKEDENGINEERING ############

Get Force Actuator Data Telemetry - ParkedEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - ParkedEngineering
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    (${index} + ${1}) * ${3.14159}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - ParkedEngineering
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Evaluate    (${row[${forceActuatorTableIndexIndex}]} + ${1}) * ${3.14159}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

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

Verify Force Actuator Data Telemetry - Fx - ParkedEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${122.1438}    ${15.8971}    ${101.2445}    ${61.3686}    ${4.7147}    ${44.9574}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - ParkedEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - PARKEDENGINEERING ############

Get to Enabled-RaisingEngineering State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering State.
    Verify Detailed State Event    ${DetailedRaisingEngineering}

Verify Summary State Event - RaisingEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - RaisingEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - RaisingEngineering
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    (${index} + ${1}) * ${-2.71828}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${value}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${value}    lateralLoadCellForce=${value}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - RAISINGENGINEERING ############

Get Force Actuator Data Telemetry - RaisingEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - RaisingEngineering
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    (${index} + ${1}) * ${-2.71828}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - RaisingEngineering
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Evaluate    (${row[${forceActuatorTableIndexIndex}]} + ${1}) * ${-2.71828}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

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

Verify Force Actuator Data Telemetry - Fx - RaisingEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${113.1793}    ${0.4208}    ${19.5833}    ${66.3595}    ${11.4588}    ${110.1077}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - RaisingEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - RAISINGENGINEERING ############

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActiveEngineering}

Verify Summary State Event - RaisingEngineering Complete
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - ActiveEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - ActiveEngineering
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} / ${1000}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${value}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${value}    lateralLoadCellForce=${value}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - ACTIVEENGINEERING ############

Get Force Actuator Data Telemetry - ActiveEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - ActiveEngineering
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} / ${1000}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - ActiveEngineering
    [Tags]    functional
    Comment    SecondaryCylinderForce is set by the M1M3_Simulator.setDualPneumaticForceAndStatus keyword, lateralLoadCellForce parameter, for ILC addresses > 16.
    ...    NOTE: There are only 112 ILCs with address > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    Continue For Loop If     ${row[${forceActuatorTableAddressIndex}]} <= ${16}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} / ${1000}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    SecondaryCylinderForce    ${fadata.SecondaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

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

Verify Force Actuator Data Telemetry - Fx - ActiveEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${18.352}    ${120.0051}    ${72.4781}    ${99.2511}    ${55.4351}    ${12.7859}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - ActiveEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - ACTIVEENGINEERING ############

Get to Enabled-LoweringEngineering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters LoweringEngineering State.
    Verify Detailed State Event    ${DetailedLoweringEngineering}

Verify Summary State Event - LoweringEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Force Actuator Info Event - LoweringEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Set Force Actuator Forces And Statuses - LoweringEngineering
    [Tags]    functional
    Set Log Level    TRACE
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} / ${1000} * ${-1}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} <= ${16}    Set Single Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    loadCellForce=${value}
    \    Run Keyword If    ${row[${forceActuatorTableAddressIndex}]} > ${16}    Set Dual Pneumatic Force And Status    subnet=${row[${forceActuatorTableSubnetIndex}]}
    ...    serverAddr=${row[${forceActuatorTableAddressIndex}]}    statusByte=${0}    axialLoadCellForce=${value}    lateralLoadCellForce=${index}
    \    ${index}=    Evaluate    ${index} + ${1}
    Comment    Add a one second delay, to allow the simulator to finish applying the values.
    Sleep    1s
    Set Log Level    INFO

############ BEGIN Verify Force Actuator Data Telemetry - LOWERINGENGINEERING ############

Get Force Actuator Data Telemetry - LoweringEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Set Suite Variable    ${fadata}
    Should Be True    ${valid}

Verify Force Actuator Data Telemetry - PrimaryCylinderForce - LoweringEngineering
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} / ${1000} * ${-1}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

Verify Force Actuator Data Telemetry - SecondaryCylinderForce - LoweringEngineering
    [Tags]    functional
    Comment    PrimaryCylinderForce is set by the M1M3_Simulator.setSinglePneumaticForceAndStatus keyword, loadCellForce parameter for ILC addresses <= 16 OR
    ...    M1M3_Simulator.setDualPneumaticForceAndStatus keyword, axialLoadCellForce parameter for ILC addresses > 16.
    ${index}=    Set Variable    ${0}
    :FOR    ${row}    IN    @{forceActuatorTable}
    \    ${value}=    Evaluate    ${row[${forceActuatorTableIDIndex}]} / ${1000} * ${-1}
    \    Run Keyword and Continue on Failure    Verify Irrational Value    PrimaryCylinderForce    ${fadata.PrimaryCylinderForce[${index}]}    ${tolerance}    ${value}
    \    ${index}=    Evaluate    ${index} + ${1}

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

Verify Force Actuator Data Telemetry - Fx - LoweringEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    Fx    ${0.001}    ${30.9403}    ${56.7542}    ${24.5752}    ${97.4168}    ${77.5772}    ${68.1742}

Verify Force Actuator Data Telemetry - OffsetForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    OffsetForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Force Actuator Data Telemetry - AccelerationForcesApplied - LoweringEngineering
    [Tags]    functional    skipped
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
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
    Comment    Fx is set by the M1M3_Simulator.setHardpointDCAPressure keyword, pressure4LateralPush parameter.
    Verify Irrational Array    ${fadata}    BalanceForcesApplied    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Force Actuator Data Telemetry - LOWERINGENGINEERING ############

Wait Until Engineering Lower Completes
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParkedEngineering}

Verify Summary State Event - LoweringEngineering Complete
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Get to Disabled State - Cleanup
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    Verify Detailed State Event    ${DetailedDisabled}

Verify Summary State Event - Disabled
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryDisabled}

Verify Force Actuator Info Event - Disabled from Enabled
    [Tags]    functional
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
    [Tags]    functional
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryStandby}

Verify Force Actuator Info Event - Standby
    [Tags]    functional
    Comment    Verify system does NOT publish Force Actuator Info Event.
    ${valid}    ${data}=    Get Force Actuator Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Verify Force Actuator Data Telemetry - Standby
    [Tags]    functional
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Should Be True    ${valid}
    Comment    Verify Force Actuator Data Telemetry is NOT published in Standby.
    ${valid}    ${fadata}=    Get Force Actuator Data Telemetry
    Should Not Be True    ${valid}

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
    Report Force Actuator Info Event    ${data}
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
