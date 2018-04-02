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
    Verify Summary State Event    ${SummaryDisabled}

Verify Detailed State - Standby
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${DetailedDisabled}

Enable Command
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Detailed State - Parked
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${DetailedParked}

Raise Command
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Raising Detailed State.
    Verify Detailed State Event    ${DetailedRaising}

Verify Summary State Event - Raise
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActive}

Verify Summary State Event - Raise Completes
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

EnterEngineering Command from Active State
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ActiveEngineering Detailed State.
    Verify Detailed State Event    ${DetailedActiveEngineering}

Verify Summary State Event - EnterEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

ExitEngineering Command from ActiveEngineering State
    [Tags]    functional
    Comment    Issue ExitEngineering Command.
    Issue ExitEngineering Command
    Comment    Verify system enters Active Detailed State.
    Verify Detailed State Event    ${DetailedActive}

Verify Summary State Event - ExitEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Lower Command
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters Lowering State.
    Verify Detailed State Event    ${DetailedLowering}

Verify Summary State Event - Lower
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParked}

Verify Summary State Event - Lower Completes
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Start Raise
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Raising Detailed State.
    Verify Detailed State Event    ${DetailedRaising}

Verify Summary State Event - Raise Abort
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Abort Raise 
    [Tags]    functional
    Comment    Issue Abort Raise Command.
    Issue Abort Raise Command
    Comment    Verify system enters Lowering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedLowering}

Verify Summary State Event - Abort
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Wait Until Lower Completes - Abort
    [Tags]    functional
    Comment    Verify system enters Parked State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParked}

Verify Summary State Event - Lower Abort
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

EnterEngineering Command
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${DetailedParkedEngineering}

Verify Summary State Event - EnterEngineering Disable
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Disable Command from ParkedEngineering
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.

Verify Summary State Event - Disable from ParkedEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryDisabled}

Verify System Disabled Detailed State from ParkedEngineering
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${DetailedDisabled}

Enable Command back to Parked
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Enabled State.

Verify Summary State Event - Back to Parked
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Detailed State back to Parked
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${DetailedParked}

EnterEngineering Command back to ParkedEngineering
    [Tags]    functional
    Comment    Issue EnterEngineering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${DetailedParkedEngineering}

Verify Summary State Event - Back to ParkedEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Raise Command - Engineering
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering Detailed State.
    Verify Detailed State Event    ${DetailedRaisingEngineering}

Verify Summary State Event - RaiseEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEnginerring Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedActiveEngineering}

Verify Summary State Event - RaiseEngineering Complete
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Lower Command - Engineering
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters LoweringEngineering Detailed State.
    Verify Detailed State Event    ${DetailedLoweringEngineering}

Verify Summary State Event - LowerEngineering
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Wait Until Engineering Lower Completes
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParkedEngineering}

Verify Summary State Event - LowerEngineering Complete
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Start EngineeringRaise for Abort
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters RaisingEngineering Detailed State.
    Verify Detailed State Event    ${DetailedRaisingEngineering}

Verify Summary State Event - RaiseEngineering for Abort
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Abort EngineeringRaise
    [Tags]    functional
    Comment    Issue Abort Raise Command.
    Issue Abort Raise Command
    Comment    Verify system enters LoweringEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedLoweringEngineering}

Verify Summary State Event - Abort
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Wait Until EngineeringLower Completes - Abort
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParkedEngineering}

Verify Summary State Event - Abort - Lower Complete
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

ExitEngineering Command
    [Tags]    functional
    Comment    Issue ExitEngineering Command.
    Issue ExitEngineering Command
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${DetailedParked}

Verify Summary State Event - ExitEngineering Cleanup
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Disable Command - Cleanup
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    Verify Summary State Event    ${SummaryDisabled}

Verify System Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${DetailedDisabled}

Standby Command - Cleanup
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    Verify Summary State Event    ${SummaryStandby}

Verify System Standby Detailed State
    [Tags]    functional
    Comment    Verify system enters Standby Detailed State.
    Verify Detailed State Event    ${DetailedStandby}
