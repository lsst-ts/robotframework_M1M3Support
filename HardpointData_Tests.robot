*** Settings ***
Documentation    M1M3 Hardpoint Actuator and Hardpoint Monitor Telemetry tests.
Force Tags    
Suite Setup    Log Many    host=${Host}    CSC=${subSystem}    timeout=${timeout}
Suite Teardown    Set to Defaults
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
    Verify Detailed State Event    ${DetailedDisabled}

Verify Summary State Disabled Event
    [Tags]    functional
    Comment    Verify system enters Disabled Summary State.
    Verify Summary State Event    ${SummaryDisabled}

Get Hardpoint Monitor Info Event - Disabled
    [Tags]    functional
    ${valid}    ${hpmidata}=    Get Event    Hardpoint Monitor Info
    Set Suite Variable    ${hpmidata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Info Event Attributes ############

Verify Hardpoint Monitor Info Event - ILCApplicationType
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    ILCApplicationType    ${3}    ${3}    ${3}    ${3}    ${3}    ${3}

Verify Hardpoint Monitor Info Event - ILCUniqueId
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    ILCUniqueId    ${11}    ${12}    ${13}    ${14}    ${15}    ${16}

Verify Hardpoint Monitor Info Event - MajorRevision
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    MajorRevision    ${8}    ${8}    ${8}    ${8}    ${8}    ${8}

Verify Hardpoint Monitor Info Event - MinorRevision
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    MinorRevision    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineFirmwareType
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    MezzanineFirmwareType    ${52}    ${52}    ${52}    ${52}    ${52}    ${52}

Verify Hardpoint Monitor Info Event - MezzanineMajorRevision
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    MezzanineMajorRevision    ${8}    ${8}    ${8}    ${8}    ${8}    ${8}

Verify Hardpoint Monitor Info Event - MezzanineMinorRevision
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    MezzanineMinorRevision    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Info Event - MezzanineUniqueId
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    MezzanineUniqueId    ${11}    ${12}    ${13}    ${14}    ${15}    ${16}

Verify Hardpoint Monitor Info Event - ModbusAddress
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    ModbusAddress    ${84}    ${85}    ${86}    ${87}    ${88}    ${89}

Verify Hardpoint Monitor Info Event - ModbusSubnet
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    ModbusSubnet    ${5}    ${5}    ${5}    ${5}    ${5}    ${5}

Verify Hardpoint Monitor Info Event - NetworkNodeType
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    NetworkNodeType    ${3}    ${3}    ${3}    ${3}    ${3}    ${3}

Verify Hardpoint Monitor Info Event - ReferenceID
    [Tags]    functional
    Verify Rational Array    ${hpmidata}    ReferenceId    ${11}    ${12}    ${13}    ${14}    ${15}    ${16}

############ END Verify Hardpoint Monitor Info Event Attributes ############

############ BEGIN Verify Hardpoint Monitor Data Telemetry Attributes ############

Get Hardpoint Monitor Data Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${hpdata}=    Get Hardpoint Monitor Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.1}    ${-0.1}    ${-1.1}    ${-2.1}    ${-3.1}    ${-4.1}    ${-5.1}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${0.2}    ${1.2}    ${2.2}    ${3.2}    ${4.2}    ${5.2}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.1}    ${0.1}    ${1.1}    ${2.1}    ${3.1}    ${4.1}    ${5.1}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry Attributes ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry ############

Verify Hardpoint Monitor Data Telemetry - StepsCommanded - Parked
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - Parked
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - MeasuredForce - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - Parked
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - Parked
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - Parked
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - Parked
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - Parked
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - Parked
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - Parked
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - Parked
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - Parked
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}

Verify Hardpoint Monitor Data Telemetry - XRotation - Parked
    [Tags]    functional
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}

Verify Hardpoint Monitor Data Telemetry - YPosition - Parked
    [Tags]    functional
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - Parked
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}

Verify Hardpoint Monitor Data Telemetry - ZPosition - Parked
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - Parked
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}

############ END Verify Hardpoint Monitor Data Telemetry ############

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

Verify Hardpoint Monitor Info Event - Parked
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Event Hardpoint Monitor Info
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - Parked
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - PARKED ############

Set Hardpoint Forces And Statuses - Parked
    [Tags]    functional
    Set Hardpoint Force And Status    ${1}   ${0}    ${88476}    ${350.924}
    Set Hardpoint Force And Status    ${2}   ${0}    ${4812}    ${559.537}
    Set Hardpoint Force And Status    ${3}   ${0}    ${-34908}    ${-53.534}
    Set Hardpoint Force And Status    ${4}   ${0}    ${-5373}    ${318.700}
    Set Hardpoint Force And Status    ${5}   ${0}    ${16161}    ${-586.714}
    Set Hardpoint Force And Status    ${6}   ${0}    ${-53064}    ${950.831}

Set Hardpoint Displacement LVDTs - Parked
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${-67.7013}    ${-32.0664}
    Set Hardpoint Displacement LVDT    ${85}   ${80.8065}    ${30.7562}
    Set Hardpoint Displacement LVDT    ${86}   ${-779.3144}    ${381.2256}
    Set Hardpoint Displacement LVDT    ${87}   ${691.2441}    ${-603.9484}
    Set Hardpoint Displacement LVDT    ${88}   ${261.4818}    ${-859.8013}
    Set Hardpoint Displacement LVDT    ${89}   ${-553.3500}    ${-390.1598}
    
Set Hardpoint Pressures - Parked
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${827.8000}    ${-296.9654}    ${855.4093}    ${-896.4723}
    Set Hardpoint DCA Pressure    ${85}    ${24.0640}    ${976.2457}    ${309.1567}    ${58.3888}
    Set Hardpoint DCA Pressure    ${86}    ${439.5877}    ${466.7696}    ${994.3187}    ${459.2541}
    Set Hardpoint DCA Pressure    ${87}    ${-593.9491}    ${981.7325}    ${460.6435}    ${563.6204}
    Set Hardpoint DCA Pressure    ${88}    ${-767.0862}    ${269.1810}    ${-733.5420}    ${-152.2537}
    Set Hardpoint DCA Pressure    ${89}    ${737.8273}    ${-484.2785}    ${-757.4126}    ${210.0550}

Get Hardpoint Data Telemetry - Parked
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${-67.7013}    ${80.8065}    ${-779.3144}    ${691.2441}    ${261.4818}    ${-553.3500}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${-32.0664}    ${30.7562}    ${381.2256}    ${-603.9484}    ${-859.8013}    ${-390.1598}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${827.8000}    ${24.0640}    ${439.5877}    ${-593.9491}    ${-767.0862}    ${737.8273}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - PARKED ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - PARKED ############

Verify Hardpoint Monitor Data Telemetry - StepsCommanded - Parked
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - Parked
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - MeasuredForce - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - Parked
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - Parked
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - Parked
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - Parked
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - Parked
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - Parked
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - Parked
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - Parked
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - Parked
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - Parked
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}

Verify Hardpoint Monitor Data Telemetry - XRotation - Parked
    [Tags]    functional
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}

Verify Hardpoint Monitor Data Telemetry - YPosition - Parked
    [Tags]    functional
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - Parked
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}

Verify Hardpoint Monitor Data Telemetry - ZPosition - Parked
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - Parked
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}

############ END Verify Hardpoint Actuator Data Telemetry - PARKED ############

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

Verify Hardpoint Monitor Info Event - Raising
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - Raising
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - RAISING ############

Set Hardpoint Forces And Statuses - Raising
    [Tags]    functional
    Comment    Set Encoders (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Displacement LVDTs - Raising
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${6.2985}    ${3.2604}
    Set Hardpoint Displacement LVDT    ${85}   ${-0.1147}    ${-3.9019}
    Set Hardpoint Displacement LVDT    ${86}   ${3.8486}    ${8.2823}
    Set Hardpoint Displacement LVDT    ${87}   ${-6.173}    ${0.1635}
    Set Hardpoint Displacement LVDT    ${88}   ${-4.6194}    ${-8.9626}
    Set Hardpoint Displacement LVDT    ${89}   ${-4.2489}    ${1.8729}

Set Hardpoint Pressures - Raising
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${34.4916}    ${91.6829}    ${99.4094}    ${76.0364}
    Set Hardpoint DCA Pressure    ${85}    ${16.2201}    ${32.3556}    ${11.5845}    ${90.2067}
    Set Hardpoint DCA Pressure    ${86}    ${51.4933}    ${35.8018}    ${19.6609}    ${44.3858}
    Set Hardpoint DCA Pressure    ${87}    ${44.2715}    ${16.7405}    ${64.2425}    ${13.983}
    Set Hardpoint DCA Pressure    ${88}    ${2.9238}    ${97.8798}    ${1.6894}    ${31.9756}
    Set Hardpoint DCA Pressure    ${89}    ${35.6619}    ${53.9305}    ${124.4494}    ${77.4635}

Get Hardpoint Data Telemetry - Raising
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${6.2985}    ${-0.1147}    ${3.8486}    ${-6.173}    ${-4.6194}    ${-4.2489}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${34.4916}    ${16.2201}    ${51.4933}    ${44.2715}    ${2.9238}    ${35.6619}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${3.2604}    ${-3.9019}    ${8.2823}    ${0.1635}    ${-8.9626}    ${1.8729}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - RAISING ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - RAISING ############

Verify Hardpoint Monitor Data Telemetry - StepsCommanded - Raising
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - Raising
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - MeasuredForce - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - Raising
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - Raising
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - Raising
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - Raising
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - Raising
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - Raising
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - Raising
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - Raising
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - Raising
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}

Verify Hardpoint Monitor Data Telemetry - XRotation - Raising
    [Tags]    functional
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}

Verify Hardpoint Monitor Data Telemetry - YPosition - Raising
    [Tags]    functional
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - Raising
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}

Verify Hardpoint Monitor Data Telemetry - ZPosition - Raising
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - Raising
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}

############ END Verify Hardpoint Actuator Data Telemetry - RAISING ############


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
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Hardpoint Monitor Info Event - Active
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - Active
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - ACTIVE ############

Set Hardpoint Forces And Statuses - Active
    [Tags]    functional
    Comment    Set Encoders (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${93738}    ${4812.3538}
    Set Hardpoint Force And Status    ${2}   ${0}    ${-267778}    ${-3943.7594}
    Set Hardpoint Force And Status    ${3}   ${0}    ${-403132}    ${4602.6788}
    Set Hardpoint Force And Status    ${4}   ${0}    ${-102335}    ${3539.1055}
    Set Hardpoint Force And Status    ${5}   ${0}    ${-453498}    ${-1379.5847}
    Set Hardpoint Force And Status    ${6}   ${0}    ${150384}    ${-878.3023}

Set Hardpoint Displacement LVDTs - Active
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${-6.356}    ${-1.7328}
    Set Hardpoint Displacement LVDT    ${85}   ${-2.4262}    ${-1.4}
    Set Hardpoint Displacement LVDT    ${86}   ${5.09}    ${0.0076}
    Set Hardpoint Displacement LVDT    ${87}   ${2.9923}    ${7.498}
    Set Hardpoint Displacement LVDT    ${88}   ${3.7093}    ${-6.7294}
    Set Hardpoint Displacement LVDT    ${89}   ${2.6619}    ${-0.1038}

Set Hardpoint Pressures - Active
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${50.831}    ${31.1756}    ${114.8652}    ${101.3123}
    Set Hardpoint DCA Pressure    ${85}    ${120.2331}    ${41.4072}    ${87.9407}    ${95.6432}
    Set Hardpoint DCA Pressure    ${86}    ${82.262}    ${5.7602}    ${25.5702}    ${87.8503}
    Set Hardpoint DCA Pressure    ${87}    ${111.5033}    ${113.6051}    ${93.0818}    ${60.0473}
    Set Hardpoint DCA Pressure    ${88}    ${91.9502}    ${44.4449}    ${10.4506}    ${119.7166}
    Set Hardpoint DCA Pressure    ${89}    ${48.0472}    ${107.8284}    ${45.1647}    ${71.4285}

Get Hardpoint Data Telemetry - Active
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${-6.356}    ${-2.4262}    ${5.09}    ${2.9923}    ${3.7093}    ${2.6619}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${50.831}    ${120.2331}    ${82.262}    ${111.5033}    ${91.9502}    ${48.0472}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${-1.7328}    ${-1.4}    ${0.0076}    ${7.498}    ${-6.7294}    ${-0.1038}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - ACTIVE ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - ACTIVE ############
    
Verify Hardpoint Monitor Data Telemetry - StepsCommanded - Active
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - Active
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Hardpoint Monitor Data Telemetry - MeasuredForce - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - Active
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - Active
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - Active
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - Active
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - Active
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - Active
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - Active
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - Active
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}
    
Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - Active
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - Active
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}
    
Verify Hardpoint Monitor Data Telemetry - XRotation - Active
    [Tags]    functional 
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}
    
Verify Hardpoint Monitor Data Telemetry - YPosition - Active
    [Tags]    functional  
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - Active
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}
    
Verify Hardpoint Monitor Data Telemetry - ZPosition - Active
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - Active
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}
    
############ END Verify Hardpoint Actuator Data Telemetry - ACTIVE ############


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

Verify Hardpoint Monitor Info Event - Lowering
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - Lowering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - LOWERING ############

Set Hardpoint Forces And Statuses - Lowering
    [Tags]    functional
    Comment    Set Encoders (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Displacement LVDTs - Lowering
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${-4.0986}    ${-3.8844}
    Set Hardpoint Displacement LVDT    ${85}   ${-5.6215}    ${-1.0793}
    Set Hardpoint Displacement LVDT    ${86}   ${9.1817}    ${-3.5968}
    Set Hardpoint Displacement LVDT    ${87}   ${-5.8255}    ${-9.6489}
    Set Hardpoint Displacement LVDT    ${88}   ${-5.9124}    ${-4.1641}
    Set Hardpoint Displacement LVDT    ${89}   ${6.3352}    ${9.444}

Set Hardpoint Pressures - Lowering
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${123.4892}    ${24.4268}    ${75.2657}    ${72.6079}
    Set Hardpoint DCA Pressure    ${85}    ${27.0135}    ${65.2718}    ${102.1222}    ${44.6229}
    Set Hardpoint DCA Pressure    ${86}    ${44.2858}    ${115.3094}    ${74.7107}    ${61.5088}
    Set Hardpoint DCA Pressure    ${87}    ${51.5121}    ${102.85}    ${47.3032}    ${67.547}
    Set Hardpoint DCA Pressure    ${88}    ${23.4114}    ${97.2484}    ${42.6373}    ${19.0961}
    Set Hardpoint DCA Pressure    ${89}    ${73.439}    ${122.8257}    ${35.761}    ${81.3655}

Get Hardpoint Data Telemetry - Lowering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${-4.0986}    ${-5.6215}    ${9.1817}    ${-5.8255}    ${-5.9124}    ${6.3352}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${123.4892}    ${27.0135}    ${44.2858}    ${51.5121}    ${23.4114}    ${73.439}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${-3.8844}    ${-1.0793}    ${-3.5968}    ${-9.6489}    ${-4.1641}    ${9.444}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - LOWERING ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - LOWERING ############
    
Verify Hardpoint Monitor Data Telemetry - StepsCommanded - Lowering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - Lowering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Hardpoint Monitor Data Telemetry - MeasuredForce - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - Lowering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - Lowering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - Lowering
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - Lowering
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - Lowering
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - Lowering
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - Lowering
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - Lowering
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}
    
Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - Lowering
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - Lowering
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}
    
Verify Hardpoint Monitor Data Telemetry - XRotation - Lowering
    [Tags]    functional 
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}
    
Verify Hardpoint Monitor Data Telemetry - YPosition - Lowering
    [Tags]    functional  
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - Lowering
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}
    
Verify Hardpoint Monitor Data Telemetry - ZPosition - Lowering
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - Lowering
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}
    
############ END Verify Hardpoint Actuator Data Telemetry - LOWERING ############


Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
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

Verify Hardpoint Monitor Info Event - ParkedEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - ParkedEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - PARKEDENGINEERING ############

Set Hardpoint Forces And Statuses - ParkedEngineering
    [Tags]    functional
    Comment    Set Encoders (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${192148}    ${-765.5576}
    Set Hardpoint Force And Status    ${2}   ${0}    ${-406285}    ${-4408.2886}
    Set Hardpoint Force And Status    ${3}   ${0}    ${356122}    ${2683.3783}
    Set Hardpoint Force And Status    ${4}   ${0}    ${-254032}    ${1022.9206}
    Set Hardpoint Force And Status    ${5}   ${0}    ${-97329}    ${2359.2162}
    Set Hardpoint Force And Status    ${6}   ${0}    ${369088}    ${4170.0464}

Set Hardpoint Displacement LVDTs - ParkedEngineering
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${-5.7547}    ${-0.9152}
    Set Hardpoint Displacement LVDT    ${85}   ${7.5998}    ${-5.3859}
    Set Hardpoint Displacement LVDT    ${86}   ${-0.6323}    ${-3.6556}
    Set Hardpoint Displacement LVDT    ${87}   ${1.4139}    ${-2.7282}
    Set Hardpoint Displacement LVDT    ${88}   ${3.0318}    ${5.6386}
    Set Hardpoint Displacement LVDT    ${89}   ${3.4932}    ${-5.2086}

Set Hardpoint Pressures - ParkedEngineering
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${42.6241}    ${50.8365}    ${72.6747}    ${122.1438}
    Set Hardpoint DCA Pressure    ${85}    ${70.8409}    ${61.6645}    ${5.7223}    ${15.8971}
    Set Hardpoint DCA Pressure    ${86}    ${103.4864}    ${86.5637}    ${46.5228}    ${101.2445}
    Set Hardpoint DCA Pressure    ${87}    ${77.7477}    ${3.3414}    ${106.6168}    ${61.3686}
    Set Hardpoint DCA Pressure    ${88}    ${13.7352}    ${96.3002}    ${46.609}    ${4.7147}
    Set Hardpoint DCA Pressure    ${89}    ${27.3488}    ${73.0917}    ${56.3336}    ${44.9574}

Get Hardpoint Data Telemetry - ParkedEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${-5.7547}    ${7.5998}    ${-0.6323}    ${1.4139}    ${3.0318}    ${3.4932}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${42.6241}    ${70.8409}    ${103.4864}    ${77.7477}    ${13.7352}    ${27.3488}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${-0.9152}    ${-5.3859}    ${-3.6556}    ${-2.7282}    ${5.6386}    ${-5.2086}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - PARKEDENGINEERING ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - PARKEDENGINEERING ############
    
Verify Hardpoint Monitor Data Telemetry - StepsCommanded - ParkedEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - ParkedEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Hardpoint Monitor Data Telemetry - MeasuredForce - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - ParkedEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - ParkedEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}
    
Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}
    
Verify Hardpoint Monitor Data Telemetry - XRotation - ParkedEngineering
    [Tags]    functional 
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}
    
Verify Hardpoint Monitor Data Telemetry - YPosition - ParkedEngineering
    [Tags]    functional  
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}
    
Verify Hardpoint Monitor Data Telemetry - ZPosition - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - ParkedEngineering
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}
    
############ END Verify Hardpoint Actuator Data Telemetry - PARKEDENGINEERING ############


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

Verify Hardpoint Monitor Info Event - RaisingEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - RaisingEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - RAISINGENGINEERING ############

Set Hardpoint Forces And Statuses - RaisingEngineering
    [Tags]    functional
    Comment    Set Encoders (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Displacement LVDTs - RaisingEngineering
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${6.5002}    ${-2.2664}
    Set Hardpoint Displacement LVDT    ${85}   ${4.3867}    ${-0.4983}
    Set Hardpoint Displacement LVDT    ${86}   ${-0.6658}    ${-4.9625}
    Set Hardpoint Displacement LVDT    ${87}   ${2.8957}    ${6.1291}
    Set Hardpoint Displacement LVDT    ${88}   ${-4.0986}    ${0.1223}
    Set Hardpoint Displacement LVDT    ${89}   ${-8.0855}    ${-5.8437}

Set Hardpoint Pressures - RaisingEngineering
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${38.1029}    ${59.0454}    ${69.2918}    ${113.1793}
    Set Hardpoint DCA Pressure    ${85}    ${96.8142}    ${79.8555}    ${108.4955}    ${0.4208}
    Set Hardpoint DCA Pressure    ${86}    ${78.9591}    ${104.2031}    ${27.2021}    ${19.5833}
    Set Hardpoint DCA Pressure    ${87}    ${29.5881}    ${79.1663}    ${65.1358}    ${66.3595}
    Set Hardpoint DCA Pressure    ${88}    ${101.6804}    ${45.8824}    ${97.2111}    ${11.4588}
    Set Hardpoint DCA Pressure    ${89}    ${115.2536}    ${48.1822}    ${22.9784}    ${110.1077}

Get Hardpoint Data Telemetry - RaisingEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - RaisingEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${6.5002}    ${4.3867}    ${-0.6658}    ${2.8957}    ${-4.0986}    ${-8.0855}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - RaisingEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${38.1029}    ${96.8142}    ${78.9591}    ${29.5881}    ${101.6804}    ${115.2536}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - RaisingEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${-2.2664}    ${-0.4983}    ${-4.9625}    ${6.1291}    ${0.1223}    ${-5.8437}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - RaisingEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - RaisingEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - RaisingEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - RAISINGENGINEERING ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - RAISINGENGINEERING ############
    
Verify Hardpoint Monitor Data Telemetry - StepsCommanded - Raising
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - Raising
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Hardpoint Monitor Data Telemetry - MeasuredForce - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - Raising
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - Raising
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - Raising
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - Raising
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - Raising
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - Raising
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - Raising
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - Raising
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}
    
Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - Raising
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - Raising
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}
    
Verify Hardpoint Monitor Data Telemetry - XRotation - Raising
    [Tags]    functional 
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}
    
Verify Hardpoint Monitor Data Telemetry - YPosition - Raising
    [Tags]    functional  
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - Raising
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}
    
Verify Hardpoint Monitor Data Telemetry - ZPosition - Raising
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - Raising
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}
    
############ END Verify Hardpoint Actuator Data Telemetry - RAISING ############


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
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Hardpoint Monitor Info Event - ActiveEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - ActiveEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - ACTIVEENGINEERING ############

Set Hardpoint Forces And Statuses - ActiveEngineering
    [Tags]    functional
    Comment    Set Encoders (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${-37641}    ${1863.7192}
    Set Hardpoint Force And Status    ${2}   ${0}    ${163077}    ${3828.2121}
    Set Hardpoint Force And Status    ${3}   ${0}    ${26358}    ${190.6504}
    Set Hardpoint Force And Status    ${4}   ${0}    ${325099}    ${1581.8369}
    Set Hardpoint Force And Status    ${5}   ${0}    ${-162594}    ${-264.2161}
    Set Hardpoint Force And Status    ${6}   ${0}    ${-417537}    ${1835.9168}

Set Hardpoint Displacement LVDTs - ActiveEngineering
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${-7.1027}    ${-3.3515}
    Set Hardpoint Displacement LVDT    ${85}   ${4.9707}    ${-4.0261}
    Set Hardpoint Displacement LVDT    ${86}   ${-5.3761}    ${2.4002}
    Set Hardpoint Displacement LVDT    ${87}   ${3.0922}    ${4.856}
    Set Hardpoint Displacement LVDT    ${88}   ${3.1161}    ${6.8209}
    Set Hardpoint Displacement LVDT    ${89}   ${7.2899}    ${-2.8102}

Set Hardpoint Pressures - ActiveEngineering
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${2.9479}    ${31.8313}    ${121.2799}    ${18.352}
    Set Hardpoint DCA Pressure    ${85}    ${94.9948}    ${105.0573}    ${35.3427}    ${120.0051}
    Set Hardpoint DCA Pressure    ${86}    ${2.0569}    ${33.7693}    ${51.5575}    ${72.4781}
    Set Hardpoint DCA Pressure    ${87}    ${62.0459}    ${81.5766}    ${118.9956}    ${99.2511}
    Set Hardpoint DCA Pressure    ${88}    ${22.2302}    ${55.9627}    ${98.9298}    ${55.4351}
    Set Hardpoint DCA Pressure    ${89}    ${60.5436}    ${9.5247}    ${72.1312}    ${12.7859}

Get Hardpoint Data Telemetry - ActiveEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${-7.1027}    ${4.9707}    ${-5.3761}    ${3.0922}    ${3.1161}    ${7.2899}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${2.9479}    ${94.9948}    ${2.0569}    ${62.0459}    ${22.2302}    ${60.5436}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${-3.3515}    ${-4.0261}    ${2.4002}    ${4.856}    ${6.8209}    ${-2.8102}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - ACTIVEENGINEERING ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - ACTIVEENGINEERING ############
    
Verify Hardpoint Monitor Data Telemetry - StepsCommanded - ActiveEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - ActiveEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Hardpoint Monitor Data Telemetry - MeasuredForce - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - ActiveEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - ActiveEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}
    
Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}
    
Verify Hardpoint Monitor Data Telemetry - XRotation - ActiveEngineering
    [Tags]    functional 
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}
    
Verify Hardpoint Monitor Data Telemetry - YPosition - ActiveEngineering
    [Tags]    functional  
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}
    
Verify Hardpoint Monitor Data Telemetry - ZPosition - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - ActiveEngineering
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}
    
############ END Verify Hardpoint Actuator Data Telemetry - ACTIVEENGINEERING ############


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

Verify Hardpoint Monitor Info Event - LoweringEngineering
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Get Hardpoint Monitor Status Telemetry - LoweringEngineering
    [Tags]    functional
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Set Suite Variable    ${hpmsdata}
    Should Be True    ${valid}

############ BEGIN Verify Hardpoint Monitor Data Telemetry - LOWERINGENGINEERING ############

Set Hardpoint Forces And Statuses - LoweringEngineering
    [Tags]    functional
    Comment    Set Encoders (third argument) and Forces (fourth argument) to 0 while raising or lowering, or operation will time-out and induce a Fault.
    Set Hardpoint Force And Status    ${1}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${2}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${3}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${4}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${5}   ${0}    ${0}    ${0}
    Set Hardpoint Force And Status    ${6}   ${0}    ${0}    ${0}

Set Hardpoint Displacement LVDTs - LoweringEngineering
    [Tags]    functional
    Set Hardpoint Displacement LVDT    ${84}   ${-3.2376}    ${-1.4411}
    Set Hardpoint Displacement LVDT    ${85}   ${-6.7826}    ${3.0871}
    Set Hardpoint Displacement LVDT    ${86}   ${-9.9491}    ${-6.4417}
    Set Hardpoint Displacement LVDT    ${87}   ${1.9663}    ${9.0157}
    Set Hardpoint Displacement LVDT    ${88}   ${-7.371}    ${-0.1022}
    Set Hardpoint Displacement LVDT    ${89}   ${9.5657}    ${1.1736}

Set Hardpoint Pressures - LoweringEngineering
    [Tags]    functional
    Set Hardpoint DCA Pressure    ${84}    ${43.7634}    ${2.5499}    ${4.3249}    ${30.9403}
    Set Hardpoint DCA Pressure    ${85}    ${101.6443}    ${41.9807}    ${12.0199}    ${56.7542}
    Set Hardpoint DCA Pressure    ${86}    ${54.1675}    ${59.4506}    ${10.943}    ${24.5752}
    Set Hardpoint DCA Pressure    ${87}    ${53.2244}    ${53.7893}    ${60.0778}    ${97.4168}
    Set Hardpoint DCA Pressure    ${88}    ${104.1298}    ${76.6312}    ${22.548}    ${77.5772}
    Set Hardpoint DCA Pressure    ${89}    ${48.1102}    ${97.9469}    ${71.447}    ${68.1742}

Get Hardpoint Data Telemetry - LoweringEngineering
    [Tags]    functional
    Sleep    300ms    Wait for next outer loop cycle
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Set Suite Variable    ${hpdata}
    Should Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - BreakawayLVDT - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayLVDT    ${0.001}    ${-3.2376}    ${-6.7826}    ${-9.9491}    ${1.9663}    ${-7.371}    ${9.5657}

Verify Hardpoint Monitor Data Telemetry - BreakawayPressure - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    BreakawayPressure    ${0.001}    ${43.7634}    ${101.6443}    ${54.1675}    ${53.2244}    ${104.1298}    ${48.1102}

Verify Hardpoint Monitor Data Telemetry - DisplacementLVDT - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    DisplacementLVDT    ${0.001}    ${-1.4411}    ${3.0871}    ${-6.4417}    ${9.0157}    ${-0.1022}    ${1.1736}

Verify Hardpoint Monitor Data Telemetry - PressureSensor1 - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor1    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor2 - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor2    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - PressureSensor3 - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    PressureSensor3    ${0.001}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}    ${0.00024}

############ END Verify Hardpoint Monitor Data Telemetry - LOWERINGENGINEERING ############

############ BEGIN Verify Hardpoint Actuator Data Telemetry - LOWERINGENGINEERING ############
    
Verify Hardpoint Monitor Data Telemetry - StepsCommanded - LoweringEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsCommanded    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}

Verify Hardpoint Monitor Data Telemetry - StepsQueued - LoweringEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    StepsQueued    ${0}    ${0}    ${0}    ${0}    ${0}    ${0}
    
Verify Hardpoint Monitor Data Telemetry - MeasuredForce - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    MeasureForce    ${0.001}    ${350.9240}    ${559.5369}    ${-53.5340}    ${318.7000}    ${-586.7139}    ${950.8309}

Verify Hardpoint Monitor Data Telemetry - Encoder - LoweringEngineering
    [Tags]    functional
    Verify Rational Array    ${hpdata}    Encoder    ${88476}    ${4812}    ${-34908}    ${-5373}    ${16161}    ${-53064}

Verify Hardpoint Monitor Data Telemetry - Displacement - LoweringEngineering
    [Tags]    functional
    Verify Irrational Array    ${hpdata}    Displacement    ${0.001}    ${0.0216}    ${0.0011}    ${-0.0085}    ${-0.0013}    ${0.0039}    ${-0.0130}

Verify Hardpoint Monitor Data Telemetry - XForce - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    XForce    ${hpdata.XForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YForce - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    YForce    ${hpdata.YForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZForce - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    ZForce    ${hpdata.ZForce}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XMoment - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    XMoment    ${hpdata.XMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - YMoment - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    YMoment    ${hpdata.YMoment}    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - ZMoment - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    ZMoment    ${hpdata.ZMoment}    ${0.001}    ${0.0216}
    
Verify Hardpoint Monitor Data Telemetry - ForceMagnitude - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    ${hpdata}    ForceMagnitude    ${0.001}    ${0.0216}

Verify Hardpoint Monitor Data Telemetry - XPosition - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    XPosition    ${hpdata.XPosition}    ${0.001}    ${0.0164}
    
Verify Hardpoint Monitor Data Telemetry - XRotation - LoweringEngineering
    [Tags]    functional 
    Verify Irrational Value    XRotation    ${hpdata.XRotation}    ${0.001}    ${0.0023}
    
Verify Hardpoint Monitor Data Telemetry - YPosition - LoweringEngineering
    [Tags]    functional  
    Verify Irrational Value    YPosition    ${hpdata.YPosition}    ${0.001}    ${-0.0031}

Verify Hardpoint Monitor Data Telemetry - YRotation - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    YRotation    ${hpdata.YRotation}    ${0.001}    ${0.0001}
    
Verify Hardpoint Monitor Data Telemetry - ZPosition - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    ZPosition    ${hpdata.ZPosition}    ${0.001}    ${0.0010}

Verify Hardpoint Monitor Data Telemetry - ZRotation - LoweringEngineering
    [Tags]    functional
    Verify Irrational Value    ZRotation    ${hpdata.ZRotation}    ${0.001}    ${-0.0021}
    
############ END Verify Hardpoint Actuator Data Telemetry - LOWERINGENGINEERING ############


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

Verify Hardpoint Monitor Info Event - Disabled from Enabled
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
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

Verify Hardpoint Monitor Info Event - Standby
    [Tags]    functional
    Comment    Verify system does NOT publish Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Hardpoint Monitor Info Event
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

Verify Hardpoint Monitor Status Telemetry - Standby
    [Tags]    functional
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Should Be True    ${valid}
    Comment    Verify Hardpoint Monitor Status Telemetry is not published.
    ${valid}    ${hpmsdata}=    Get Hardpoint Monitor Status Telemetry
    Should Not Be True    ${valid}

Verify Hardpoint Monitor Data Telemetry - Standby
    [Tags]    functional
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Should Be True    ${valid}
    Comment    Verify Hardpoint Monitor Data Telemetry is not published.
    ${valid}    ${hpdata}=    Get Hardpoint Data Telemetry
    Should Not Be True    ${valid}

*** Keywords ***
Get Hardpoint Monitor Info Event
    Comment    Verify system publishes Hardpoint Monitor Info Event.
    ${valid}    ${data}=    Get Event Hardpoint Monitor Info
    Log    ${data.Timestamp}
    Log    ${data.ILCApplicationType}
    Log    ${data.ILCUniqueId}
    Log    ${data.MajorRevision}
    Log    ${data.MezzanineFirmwareType}
    Log    ${data.MezzanineMajorRevision}
    Log    ${data.MezzanineMinorRevision}
    Log    ${data.MezzanineUniqueId}
    Log    ${data.MinorRevision}
    Log    ${data.ModbusAddress}
    Log    ${data.ModbusSubnet}
    Log    ${data.NetworkNodeType}
    Log    ${data.ReferenceId}
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

Get Hardpoint Monitor Data Telemetry
    Comment    Verify system publishes Hardpoint Data Telemetry.
    ${valid}    ${data}=    Get Sample Hardpoint Monitor Data
    Log    ${data.Timestamp}
    Log    ${data.BreakawayLVDT}
    Log    ${data.DisplacementLVDT}
    Log    ${data.BreakawayPressure}
    Log    ${data.PressureSensor1}
    Log    ${data.PressureSensor2}
    Log    ${data.PressureSensor3}

Temp Keyword
    Log    ${data.BroadcastCounter}
    Log    ${data.CCWLimitOperated}
    Log    ${data.CWLimitOperated}
    Log    ${data.Displacement}
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
