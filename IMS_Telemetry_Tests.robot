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

Get IMS Telemetry - Initial
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify Displacement Sensors - Disabled
    [Tags]    functional
    Verify Displacement Telemetry    ${1.0}    ${2.0}    ${3.0}    ${4.0}    ${5.0}    ${6.0}    ${7.0}    ${8.0}

Verify Linear XYZ Position - Disabled
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.0040}    ${0.0060}    ${0.0041}

Verify Rotational XYZ Position - Disabled
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${-0.0004}    ${0.0005}    ${0.0000}

Set Displacement Sensors - Disabled
    [Tags]    functional
    Set Displacement    ${12.34}    ${-0.5}    ${9.87}    ${-83.41}    ${71.12}    ${-8.37}    ${25.35}    ${88.99}

Get IMS Telemetry - Disabled
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry    
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify IMS Timestamp - Disabled
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - Disabled - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${12.34}    ${-0.5}    ${9.87}    ${-83.41}    ${71.12}    ${-8.37}    ${25.35}    ${88.99}

Verify Linear XYZ Position - Disabled - New Values
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.0042}    ${0.0031}    ${0.0309}

Verify Rotational XYZ Position - Disabled - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${-0.0072}    ${0.0016}    ${-0.0109}

Get to Enabled-Parked State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${5}
    Verify Summary State Event    ${3}

Verify Displacement Sensors - Parked
    [Tags]    functional
    Verify Displacement Telemetry    ${12.34}    ${-0.5}    ${9.87}    ${-83.41}    ${71.12}    ${-8.37}    ${25.35}    ${88.99}

Verify Linear XYZ Position - Parked
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.0042}    ${0.0031}    ${0.0309}

Verify Rotational XYZ Position - Parked
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${-0.0072}    ${0.0016}    ${-0.0109}

Set Displacement Sensors - Parked
    [Tags]    functional
    Set Displacement    ${47.1743}    ${85.7577}    ${67.2310}    ${43.3877}    ${-37.3664}    ${4.0106}    ${88.8648}    ${-929.3697}

Get IMS Telemetry - Parked
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify IMS Timestamp - Parked
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - Parked - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${47.1743}    ${85.7577}    ${67.2310}    ${43.3877}    ${-37.3664}    ${4.0106}    ${88.8648}    ${-929.3697}

Verify Linear XYZ Position - Parked - New Values
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.0445}    ${-0.4435}    ${0.0403}

Verify Rotational XYZ Position - Parked - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.0107}    ${0.0031}    ${0.0539}

Get to Enabled-Raising State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${6}
    Verify Summary State Event    ${3}

Verify Displacement Sensors - Raising
    [Tags]    functional
    Verify Displacement Telemetry    ${47.1743}    ${85.7577}    ${67.2310}    ${43.3877}    ${-37.3664}    ${4.0106}    ${88.8648}    ${-929.3697}

Set Displacement Sensors - Raising
    [Tags]    functional
    Set Displacement    ${-259.0771}    ${556.7447}    ${-752.1578}    ${521.7670}    ${-452.3520}    ${799.7259}    ${195.1912}    ${-696.3154}

Verify Linear XYZ Position - Raising
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.0445}    ${-0.4435}    ${0.0403}

Verify Rotational XYZ Position - Raising
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.0107}    ${0.0031}    ${0.0539}

Get IMS Telemetry - Raising
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify IMS Timestamp - Raising
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - Raising - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${-259.0771}    ${556.7447}    ${-752.1578}    ${521.7670}    ${-452.3520}    ${799.7259}    ${195.1912}    ${-696.3154}

Verify Linear XYZ Position - Raising - New Values
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.6829}    ${-0.0886}    ${-0.3045}

Verify Rotational XYZ Position - Raising - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.0261}    ${0.1147}    ${0.0884}

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${7}
    Verify Summary State Event    ${3}

Verify Displacement Sensors - Active
    [Tags]    functional
    Verify Displacement Telemetry    ${-259.0771}    ${556.7447}    ${-752.1578}    ${521.7670}    ${-452.3520}    ${799.7259}    ${195.1912}    ${-696.3154}

Verify Linear XYZ Position - Active
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.6829}    ${-0.0886}    ${-0.3045}

Verify Rotational XYZ Position - Active
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.0261}    ${0.1147}    ${0.0884}

Set Displacement Sensors - Active
    [Tags]    functional
    Set Displacement    ${490.9828}    ${-230.0245}    ${-9.6216}    ${-730.5074}    ${-741.3887}    ${-735.4686}    ${-711.3698}    ${158.0139}
    
Get IMS Telemetry - Active
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}  
    Should Be True    ${valid}

Verify IMS Timestamp - Active
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - Active - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${490.9828}    ${-230.0245}    ${-9.6216}    ${-730.5074}    ${-741.3887}    ${-735.4686}    ${-711.3698}    ${158.0139}

Verify Linear XYZ Position - Active - New Values
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.4861}    ${-0.2936}    ${-0.2760}

Verify Rotational XYZ Position - Active - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.1443}    ${-0.0869}    ${-0.0842}

Get to Enabled-Lowering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${8}
    Verify Summary State Event    ${3}

Verify Displacement Sensors - Lowering
    [Tags]    functional
    Verify Displacement Telemetry     ${490.9828}    ${-230.0245}    ${-9.6216}    ${-730.5074}    ${-741.3887}    ${-735.4686}    ${-711.3698}    ${158.0139}

Verify Linear XYZ Position - Lowering
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.4861}    ${-0.2936}    ${-0.2760}

Verify Rotational XYZ Position - Lowering
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.1443}    ${-0.0869}    ${-0.0842}

Set Displacement Sensors - Lowering
    [Tags]    functional
    Set Displacement    ${-594.3147}    ${243.4215}    ${575.0925}    ${852.4911}    ${-569.6391}    ${-760.6552}    ${109.2790}    ${111.1592}
    
Get IMS Telemetry - Lowering
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify IMS Timestamp - Lowering
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - Lowering - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${-594.3147}    ${243.4215}    ${575.0925}    ${852.4911}    ${-569.6391}    ${-760.6552}    ${109.2790}    ${111.1592}

Verify Linear XYZ Position - Lowering - New Values
    [Tags]    functional 
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.2607}    ${0.4816}    ${-0.1273}

Verify Rotational XYZ Position - Lowering - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.0038}    ${-0.0483}    ${-0.0157}

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

Verify Displacement Sensors - ParkedEngineering
    [Tags]    functional
    Verify Displacement Telemetry    ${-594.3147}    ${243.4215}    ${575.0925}    ${852.4911}    ${-569.6391}    ${-760.6552}    ${109.2790}    ${111.1592}

Verify Linear XYZ Position - ParkedEngineering
    [Tags]    functional 
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.2607}    ${0.4816}    ${-0.1273}

Verify Rotational XYZ Position - ParkedEngineering
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.0038}    ${-0.0483}    ${-0.0157}

Set Displacement Sensors - ParkedEngineering
    [Tags]    functional
    Set Displacement    ${-587.6420}    ${524.2411}    ${-921.5466}    ${652.2163}    ${-431.7575}    ${-54.6197}    ${-159.1803}    ${-74.2661}
    
Get IMS Telemetry - ParkedEngineering
    [Tags]    functional    
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify IMS Timestamp - ParkedEngineering
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - ParkedEngineering - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${-587.6420}    ${524.2411}    ${-921.5466}    ${652.2163}    ${-431.7575}    ${-54.6197}    ${-159.1803}    ${-74.2661}

Verify Linear XYZ Position - ParkedEngineering - New Values
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.2391}    ${0.2898}    ${-0.5095}

Verify Rotational XYZ Position - ParkedEngineering - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${-0.0172}    ${0.0916}    ${0.0089}

Get to Enabled-RaisingEngineering State
    [Tags]    functional
    Comment    Issue Raise M1M3 Command
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering State.
    Verify Detailed State Event    ${11}
    Verify Summary State Event    ${3}

Verify Displacement Sensors - RaisingEngineering
    [Tags]    functional
    Verify Displacement Telemetry    ${-587.6420}    ${524.2411}    ${-921.5466}    ${652.2163}    ${-431.7575}    ${-54.6197}    ${-159.1803}    ${-74.2661}

Verify Linear XYZ Position - RaisingEngineering
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.2391}    ${0.2898}    ${-0.5095}

Verify Rotational XYZ Position - RaisingEngineering
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${-0.0172}    ${0.0916}    ${0.0089}

Set Displacement Sensors - RaisingEngineering
    [Tags]    functional
    Set Displacement    ${-871.8004}    ${3.1334}    ${-273.6597}    ${-518.9943}    ${715.0895}    ${-966.0888}    ${624.3778}    ${787.7910}
    
Get IMS Telemetry - RaisingEngineering
    [Tags]    functional     
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify IMS Timestamp - RaisingEngineering
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - RaisingEngineering - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${-871.8004}    ${3.1334}    ${-273.6597}    ${-518.9943}    ${715.0895}    ${-966.0888}    ${624.3778}    ${787.7910}

Verify Linear XYZ Position - RaisingEngineering - New Values
    [Tags]    functional 
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.4748}    ${0.1440}    ${0.0911}

Verify Rotational XYZ Position - RaisingEngineering - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${-0.1863}    ${0.1108}    ${-0.1377}

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${12}
    Verify Summary State Event    ${3}

Verify Displacement Sensors - ActiveEngineering
    [Tags]    functional
    Verify Displacement Telemetry    ${-871.8004}    ${3.1334}    ${-273.6597}    ${-518.9943}    ${715.0895}    ${-966.0888}    ${624.3778}    ${787.7910}

Verify Linear XYZ Position - ActiveEngineering
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.4748}    ${0.1440}    ${0.0911}

Verify Rotational XYZ Position - ActiveEngineering
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${-0.1863}    ${0.1108}    ${-0.1377}

Set Displacement Sensors - ActiveEngineering
    [Tags]    functional
    Set Displacement    ${-621.2461}    ${-684.9337}    ${482.0149}    ${-916.1041}    ${-652.9333}    ${26.4131}    ${-642.1648}    ${315.4959}

Get IMS Telemetry - ActiveEngineering
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}

Verify IMS Timestamp - ActiveEngineering
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - ActiveEngineering - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${-621.2461}    ${-684.9337}    ${482.0149}    ${-916.1041}    ${-652.9333}    ${26.4131}    ${-642.1648}    ${315.4959}

Verify Linear XYZ Position - ActiveEngineering - New Values
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.3352}    ${-0.3006}    ${-0.378}

Verify Rotational XYZ Position - ActiveEngineering - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.006}    ${-0.1307}    ${-0.0315}

Get to Enabled-LoweringEngineering State
    [Tags]    functional
    Comment    Issue Lower M1M3 Command
    Issue Lower Command
    Comment    Verify system enters Raising State.
    Verify Detailed State Event    ${13}
    Verify Summary State Event    ${3}

Verify Displacement Sensors - LoweringEngineering
    [Tags]    functional
    Verify Displacement Telemetry    ${-621.2461}    ${-684.9337}    ${482.0149}    ${-916.1041}    ${-652.9333}    ${26.4131}    ${-642.1648}    ${315.4959}

Verify Linear XYZ Position - LoweringEngineering
    [Tags]    functional
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${-0.3352}    ${-0.3006}    ${-0.378}

Verify Rotational XYZ Position - LoweringEngineering
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.006}    ${-0.1307}    ${-0.0315}

Set Displacement Sensors - LoweringEngineering
    [Tags]    functional
    Set Displacement    ${-378.6679}    ${-564.5640}    ${942.8170}    ${902.9406}    ${-570.7272}    ${675.5536}    ${-475.1258}    ${-329.4288}
    
Get IMS Telemetry - LoweringEngineering
    [Tags]    functional
    ${valid}    ${data}=    Get IMS Telemetry
    Set Suite Variable    ${data}
    Should Be True    ${valid}
    
Verify IMS Timestamp - LoweringEngineering
    [Tags]    functional    TSS-2294
    Verify Timestamp    ${data.Timestamp}

Verfiy Displacement Sensors - LoweringEngineering - New Values
    [Tags]    functional
    Verify Displacement Telemetry    ${-378.6679}    ${-564.5640}    ${942.8170}    ${902.9406}    ${-570.7272}    ${675.5536}    ${-475.1258}    ${-329.4288}

Verify Linear XYZ Position - LoweringEngineering - New Values
    [Tags]    functional 
    Comment    Linear Position values were pre-calculated.
    Verify Position Telemetry    ${0.0461}    ${0.2854}    ${-0.1476} 

Verify Rotational XYZ Position - LoweringEngineering - New Values
    [Tags]    functional
    Comment    Rotational Position values were pre-calculated.
    Verify Rotation Telemetry    ${0.0258}    ${-0.1649}    ${0.1495}

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

Verify Displacement Telemetry - Standby
    [Tags]    functional
    Comment    Have to get the last sample in the buffer before continuing.
    ${valid}    ${data}=    Get IMS Telemetry
    Comment    Verify system does NOT publish IMS Telemetry.
    ${valid}    ${data}=    Get IMS Telemetry
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}
    Comment    Get another reading to be sure no data is published.
    ${valid}    ${data}=    Get IMS Telemetry
    Should Not Be True    ${valid}
    Should Be True    ${data.Timestamp} == ${0.0}

*** Keywords ***
Get IMS Telemetry
    Comment    Verify system publishes IMS Telemetry.
    ${valid}    ${data}=    Get Sample IMS Data
    Log    ${data.Timestamp}
    Log    ${data.RawSensorData}
    Log Many    ${data.RawSensorData[0]}    ${data.RawSensorData[1]}
    ...    ${data.RawSensorData[2]}    ${data.RawSensorData[3]}
    ...    ${data.RawSensorData[4]}    ${data.RawSensorData[5]}
    ...    ${data.RawSensorData[6]}    ${data.RawSensorData[7]}
    Log Many    ${data.XPosition}    ${data.YPosition}    ${data.ZPosition}
    Log Many    ${data.XRotation}    ${data.YRotation}    ${data.ZRotation}
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
