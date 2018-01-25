*** Settings ***
Documentation    M1M3 State Commands tests.
Force Tags    
Suite Setup    Log Many    host=${Host}    CSC=${subSystem}    timeout=${timeout}
#...    AND    Create Session    Commander    AND    Create Session    Controller
#Suite Teardown    Close All Connections
Library    String
Library    M1M3_SAL
Resource    common.robot
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
    Verify Summary State Event    ${2}

Verify Detailed State - Standby
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${2}

Enable Command
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${3}

Verify Detailed State - Parked
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${5}

Raise Command
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Raising Detailed State.
    Verify Detailed State Event    ${6}
    Verify Summary State Event    ${3}

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    7
    Verify Summary State Event    ${3}

EnterEngineering Command from Active State
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ActiveEngineering Detailed State.
    Verify Detailed State Event    ${12}
    Verify Summary State Event    ${3}

ExitEngineering Command from ActiveEngineering State
    [Tags]    functional
    Comment    Issue ExitEngineering Command.
    Issue ExitEngineering Command
    Comment    Verify system enters Active Detailed State.
    Verify Detailed State Event    ${7}
    Verify Summary State Event    ${3}

Lower Command
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters Lowering State.
    Verify Detailed State Event    ${8}
    Verify Summary State Event    ${3}

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    5
    Verify Summary State Event    ${3}

Start Raise
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Raising Detailed State.
    Verify Detailed State Event    ${6}
    Verify Summary State Event    ${3}

Abort Raise 
    [Tags]    functional
    Comment    Issue Abort Raise Command.
    Issue Abort Raise Command
    Comment    Verify system enters Lowering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    8
    Verify Summary State Event    ${3}

Wait Until Lower Completes - Abort
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    5
    Verify Summary State Event    ${3}

EnterEngineering Command
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${10}
    Verify Summary State Event    ${3}

Disable Command from ParkedEngineering
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    Verify Summary State Event    ${2}

Verify System Disabled Detailed State from ParkedEngineering
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${2}

Enable Command back to Parked
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${3}

Verify Detailed State back to Parked
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${5}

EnterEngineering Command back to ParkedEngineering
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${10}
    Verify Summary State Event    ${3}

Raise Command - Engineering
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering Detailed State.
    Verify Detailed State Event    ${11}
    Verify Summary State Event    ${3}

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEnginerring Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    12
    Verify Summary State Event    ${3}

Lower Command - Engineering
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters LoweringEngineering Detailed State.
    Verify Detailed State Event    ${13}
    Verify Summary State Event    ${3}

Wait Until Engineering Lower Completes
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    10
    Verify Summary State Event    ${3}

Start EngineeringRaise
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering Detailed State.
    Verify Detailed State Event    ${11}
    Verify Summary State Event    ${3}

Abort EngineeringRaise
    [Tags]    functional
    Comment    Issue Abort Raise Command.
    Issue Abort Raise Command
    Comment    Verify system enters LoweringEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    13
    Verify Summary State Event    ${3}

Wait Until EngineeringLower Completes - Abort
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    10
    Verify Summary State Event    ${3}

ExitEngineering Command
    [Tags]    functional
    Comment    Issue ExitEngineering Command.
    Issue ExitEngineering Command
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${5}
    Verify Summary State Event    ${3}

Disable Command
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    Verify Summary State Event    ${2}

Verify System Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${2}

Standby Command
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    Verify Summary State Event    ${1}

Verify System Standby Detailed State
    [Tags]    functional
    Comment    Verify system enters Standby Detailed State.
    Verify Detailed State Event    ${1}
