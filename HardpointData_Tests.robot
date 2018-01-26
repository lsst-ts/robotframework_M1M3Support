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
    [Tags]    functional
    Comment    Verify system enters Disabled Summary State.
    Verify Summary State Event    ${2}

Get Hardpoint Monitor Info Event - Disabled
    [Tags]    functional
    ${valid}    ${hpmidata}=    Get Hardpoint Monitor Info Event 
    Set Suite Variable    ${hpmidata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Info Event Attributes ############

Verify Hardpoint Monitor Info Event - ApplicationCRCMismatch
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ApplicationCRCMismatch    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - ApplicationMissing
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ApplicationMissing    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - ApplicationTypeMismatch
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ApplicationTypeMismatch    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - ILCApplicationType
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ILCApplicationType    ${3}    ${3}    ${3}    ${3}    ${3}    ${3}

Verify Hardpoint Monitor Info Event - ILCSelectedOptions
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ILCSelectedOptions    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - ILCUniqueId
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ILCUniqueId    ${11}    ${12}    ${13}    ${14}    ${15}    ${16}

Verify Hardpoint Monitor Info Event - MajorRevision
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MajorRevision    ${8}    ${8}    ${8}    ${8}    ${8}    ${8}

Verify Hardpoint Monitor Info Event - MinorRevision
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MinorRevision    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineApplicationCRCMismatch
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineApplicationCRCMismatch    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineApplicationMissing
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineApplicationMissing    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineBootloaderActive
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineBootloaderActive    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineDCPRS422ChipFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineDCPRS422ChipFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineFirmwareType
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineFirmwareType    ${52}    ${52}    ${52}    ${52}    ${52}    ${52}

Verify Hardpoint Monitor Info Event - MezzanineMajorRevision
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineMajorRevision    ${8}    ${8}    ${8}    ${8}    ${8}    ${8}

Verify Hardpoint Monitor Info Event - MezzanineMinorRevision
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineMinorRevision    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineUniqueId
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineUniqueId    ${11}    ${12}    ${13}    ${14}    ${15}    ${16}

Verify Hardpoint Monitor Info Event - MezzanineUniqueIdCRCError
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    MezzanineUniqueIdCRCError    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - ModbusAddress
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ModbusAddress    ${84}    ${85}    ${86}    ${87}    ${88}    ${89}

Verify Hardpoint Monitor Info Event - ModbusSubnet
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ModbusSubnet    ${5}    ${5}    ${5}    ${5}    ${5}    ${5}

Verify Hardpoint Monitor Info Event - NetworkNodeOptions
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    NetworkNodeOptions    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - NetworkNodeType
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    NetworkNodeType    ${3}    ${3}    ${3}    ${3}    ${3}    ${3}

Verify Hardpoint Monitor Info Event - OneWire1Mismatch
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    OneWire1Mismatch    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - OneWire2Mismatch
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    OneWire2Mismatch    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - OneWireMissing
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    OneWireMissing    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - ReferenceID
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    ReferenceId    ${11}    ${12}    ${13}    ${14}    ${15}    ${16}

Verify Hardpoint Monitor Info Event - UniqueIdCRCError
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmidata}    UniqueIdCRCError    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

############ END Verify Hardpoint Monitor Info Event Attributes ############

############ BEGIN Verify Hardpoint Monitor Status Telemetry Attributes ############

Get Hardpoint Monitor Status Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Status Telemetry - AUXPowerFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    AUXPowerFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - BrownoutDetected
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    BrownoutDetected    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - EventTrapReset
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    EventTrapReset    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - FaultOverridden
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    FaultOverridden    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - MajorFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MajorFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - MezzanineEventTrapReset
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MezzanineEventTrapReset    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - MezzanineS1A1InterfaceFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MezzanineS1A1InterfaceFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - MezzanineS1A1LVDTFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MezzanineS1A1LVDTFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - MezzanineS1A2InterfaceFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MezzanineS1A2InterfaceFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - MezzanineS1A2LVDTFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MezzanineS1A2LVDTFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - MinorFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MinorFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - Mode
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    Mode    ${50}    ${50}    ${50}    ${50}    ${50}    ${50}

Verify Hardpoint Monitor Status Telemetry - MotorPowerFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    MotorPowerFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - SMCPowerFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    SMCPowerFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - SSRPowerFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    SSRPowerFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Status Telemetry - WatchdogReset
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpmsdata}    WatchdogReset    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

############ END Verify Hardpoint Monitor Status Telemetry Attributes ############

############ BEGIN Verify Hardpoint Data Telemetry Attributes ############

Get Hardpoint Data Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Data Telemetry - BreakawayLVDT
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    BreakawayLVDT    ${0.1}    ${-0.1}    ${-1.1}    ${-2.1}    ${-3.1}    ${-4.1}    ${-5.1}

Verify Hardpoint Data Telemetry - BreakawayPressure
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    BreakawayPressure    ${0.1}    ${0.1}    ${1.1}    ${2.1}    ${3.1}    ${4.1}    ${5.1}

Verify Hardpoint Data Telemetry - BroadcastCounter
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    BroadcastCounter    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Data Telemetry - CCWLimitOperated
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    CCWLimitOperated    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Data Telemetry - CWLimitOperated
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    CWLimitOperated    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Data Telemetry - Displacement
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    Displacement    ${0.00001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

Verify Hardpoint Data Telemetry DisplacementLVDT
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    DisplacementLVDT    ${0.1}    ${0.2}    ${1.2}    ${2.2}    ${3.2}    ${4.2}    ${5.2}

Verify Hardpoint Data Telemetry Encoder
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    Encoder    ${1001}    ${1002}    ${1003}    ${1004}    ${1005}    ${1006}

Verify Hardpoint Data Telemetry Force
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    Force    ${1.5}    ${2.5}    ${3.5}    ${4.5}    ${5.5}    ${6.5}

Verify Hardpoint Data Telemetry ILCFault
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    ILCFault    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Data Telemetry StepsCommanded
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Data Telemetry StepsQueued
    [Tags]    functional
    Verify Rational Topic Attribute    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Data Telemetry XPosition
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    XPosition    ${0.0001}    ${0}

Verify Hardpoint Data Telemetry XRotation
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    XRotation    ${0.0001}    ${0}

Verify Hardpoint Data Telemetry YPosition
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    YPosition    ${0.0001}    ${0}

Verify Hardpoint Data Telemetry YRotation
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    YRotation    ${0.0001}    ${0}

Verify Hardpoint Data Telemetry ZPosition
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    ZPosition    ${0.0001}    ${0.0003}

Verify Hardpoint Data Telemetry ZRotation
    [Tags]    functional
    Verify Irrational Topic Attribute    ${hpdata}    ZRotation    ${0.0001}    ${0}

############ END Verify Hardpoint Data Telemetry Attributes ############

Get to Enabled-Parked State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${5}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - Parked
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - Parked
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Get to Enabled-Raising State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${6}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - Raising
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - Raising
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${7}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - Active
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - Active
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Get to Enabled-Lowering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${8}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - Lowering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - Lowering
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${5}
    Verify Summary State Event    ${3}

Get to ParkedEngineering State
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${10}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - ParkedEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - ParkedEngineering
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Get to Enabled-RaisingEngineering State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering State.
    Verify Detailed State Event    ${11}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - RaisingEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - RaisingEngineering
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${12}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - ActiveEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - ActiveEngineering
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Get to Enabled-LoweringEngineering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${13}
    Verify Summary State Event    ${3}

Get Hardpoint Monitor Status Telemetry - LoweringEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

Get Hardpoint Data Telemetry - LoweringEngineering
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Wait Until Engineering Lower Completes
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${10}
    Verify Summary State Event    ${3}

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

Verify Hardpoint Monitor Status Telemetry - Standby
    [Tags]    functional
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Should Be True    ${valid}
    Comment    Verify Hardpoint Monitor Status Telemetry is not published.
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Should Not Be True    ${valid}

Verify Hardpoint Data Telemetry - Standby
    [Tags]    functional
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Should Be True    ${valid}
    Comment    Verify Hardpoint Data Telemetry is not published.
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Should Not Be True    ${valid}


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

Get Hardpoint Monitor Status Telemetry
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
    Log    ${data.BreakawayPressure}
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
