*** Settings ***
Documentation    Test invalid M1M3 State transitions.
Force Tags    
Suite Setup
Library    String
Library    M1M3_SAL
Resource    common.robot
Resource    Global_Vars.robot

*** Test Cases ***
From Standby Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

From Standby Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Standby Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Standby Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Standby Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "LowerM1M3"    "text"

From Standby Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Standby Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

From Standby Issue Standby Command
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

Get To Disabled State
    [Tags]    functional
    Comment    Issue Start Command.
    Issue Start Command
    Comment    Verify system enters Disabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    2

Verify Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${2}

From Disabled Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Disabled Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Disabled Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Disabled Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Disabled Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "LowerM1M3"    "text"

From Disabled Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Disabled Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

Get To Enabled State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Enabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    3

Verify Parked Detailed State
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${5}

From Enabled-Parked Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-Parked Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Enabled-Parked Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "LowerM1M3"    "text"

From Enabled-Parked Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Enabled-Parked Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-Parked Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

Get To Raising State
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${3}

Verify Raising Detailed State
    [Tags]    functional
    Comment    Verify system enters Raising Detailed State.
    Verify Detailed State Event    ${6}

From Enabled-Raising Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-Raising Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Enabled-Raising Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Enabled-Raising Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Enabled-Raising Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-Raising Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

From Enabled-Raising Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    7
    Verify Summary State Event    ${3}

From Enabled-Active Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-Active Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Enabled-Active Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Enabled-Active Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Enabled-Active Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-Active Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

From Enabled-Active Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

Get To Lowering State
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${3}

Verify Lowering Detailed State
    [Tags]    functional
    Comment    Verify system enters Lowering Detailed State.
    Verify Detailed State Event    ${8}

From Enabled-Lowering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-Lowering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Enabled-Lowering Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Enabled-Lowering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Enabled-Lowering Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "LowerM1M3"    "text"

From Enabled-Lowering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Enabled-Lowering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-Lowering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

From Enabled-Lowering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    5
    Verify Summary State Event    ${3}

Get To ParkedEngineering State
    [Tags]    functional
    Comment    Issue EnterEnginering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters Parked Engineering State.
    Verify Summary State Event    ${3}

Verify ParkedEngineering Detailed State
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${10}

From Enabled-ParkedEnginering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-ParkedEnginering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Enabled-ParkedEnginering Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "LowerM1M3"    "text"

From Enabled-ParkedEnginering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Enabled-ParkedEnginering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-ParkedEnginering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

Get To RaisingEngineering State
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${3}

Verify RaisingEngineering Detailed State
    [Tags]    functional
    Comment    Verify system enters RaisingEngineering Detailed State.
    Verify Detailed State Event    ${11}

From Enabled-RaisingEngineering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-RaisingEngineering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Enabled-RaisingEngineering Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Enabled-RaisingEngineering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Enabled-RaisingEngineering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-RaisingEngineering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

From Enabled-RaisingEngineering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    12
    Verify Summary State Event    ${3}

From Enabled-ActiveEngineering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-ActiveEngineering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Enabled-ActiveEngineering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Enabled-ActiveEngineering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Enabled-ActiveEngineering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-ActiveEngineering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

From Enabled-ActiveEngineering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

Get To LoweringEngineering State
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${3}

Verify LoweringEngineering Detailed State
    [Tags]    functional
    Comment    Verify system enters LoweringEngineering Detailed State.
    Verify Detailed State Event    ${13}

From Enabled-LoweringEngineering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Start"    "text"

From Enabled-LoweringEngineering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "EnterEngineering"    "text"

From Enabled-LoweringEngineering Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "ExitEngineering"    "text"

From Enabled-LoweringEngineering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "RaiseM1M3"    "text"

From Enabled-LoweringEngineering Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "LowerM1M3"    "text"

From Enabled-LoweringEngineering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "AbortRaiseM1M3"    "text"

From Enabled-LoweringEngineering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Standby"    "text"

From Enabled-LoweringEngineering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Enable"    "text"

From Enabled-LoweringEngineering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
	Verify Command Rejection Warning    "Disable"    "text"

Wait Until LoweringEngineering Completes
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    10
    Verify Summary State Event    ${3}

Cleanup - Disable
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    2

Verify System Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${2}

Cleanup - Standby
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    1

Verify System Standby Detailed State
    [Tags]    functional
    Comment    Verify system enters Standby Detailed State.
    Verify Detailed State Event    ${1}

*** Keywords ***
Verify No Summary State Event
    Comment    Commands are rejected silently, therefore Summary State Event is not published.
    ${valid}    ${data}=    Get Event Summary State
    Should Not Be True    ${valid}
