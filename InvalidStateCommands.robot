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
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the StandbyState."

From Standby Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the StandbyState."

From Standby Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the StandbyState."

From Standby Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the StandbyState."

From Standby Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "LowerM1M3"    "The command LowerM1M3 is not valid in the StandbyState."

From Standby Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the StandbyState."

From Standby Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the StandbyState."

From Standby Issue Standby Command
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the StandbyState."

Get To Disabled State
    [Tags]    functional
    Comment    Issue Start Command.
    Issue Start Command
    Comment    Verify system enters Disabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    ${SummaryDisabled}

Verify Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${SummaryDisabled}

From Disabled Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the DisabledState."

From Disabled Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the DisabledState."

From Disabled Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the DisabledState."

From Disabled Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the DisabledState."

From Disabled Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "LowerM1M3"    "The command LowerM1M3 is not valid in the DisabledState."

From Disabled Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the DisabledState."

From Disabled Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the DisabledState."

Get To Enabled State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Enabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    ${SummaryEnabled}

Verify Parked Detailed State
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    Verify Detailed State Event    ${DetailedParked}

From Enabled-Parked Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the ParkedState."

From Enabled-Parked Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the ParkedState."

From Enabled-Parked Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "LowerM1M3"    "The command LowerM1M3 is not valid in the ParkedState."

From Enabled-Parked Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the ParkedState."

From Enabled-Parked Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the ParkedState."

From Enabled-Parked Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the ParkedState."

Get To Raising State
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Raising Detailed State
    [Tags]    functional
    Comment    Verify system enters Raising Detailed State.
    Verify Detailed State Event    ${DetailedRaising}

From Enabled-Raising Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the RaisingState."

From Enabled-Raising Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the RaisingState."

From Enabled-Raising Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the RaisingState."

From Enabled-Raising Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the RaisingState."

From Enabled-Raising Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the RaisingState."

From Enabled-Raising Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the RaisingState."

From Enabled-Raising Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the RaisingState."

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${8}
    Verify Summary State Event    ${2}

From Enabled-Active Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the ActiveState."

From Enabled-Active Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the ActiveState."

From Enabled-Active Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the ActiveState."

From Enabled-Active Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the ActiveState."

From Enabled-Active Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the ActiveState."

From Enabled-Active Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the ActiveState."

From Enabled-Active Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the ActiveState."

Get To Lowering State
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify Lowering Detailed State
    [Tags]    functional
    Comment    Verify system enters Lowering Detailed State.
    Verify Detailed State Event    ${DetailedLowering}

From Enabled-Lowering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the LoweringState."

From Enabled-Lowering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the LoweringState."

From Enabled-Lowering Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the LoweringState."

From Enabled-Lowering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the LoweringState."

From Enabled-Lowering Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "LowerM1M3"    "The command LowerM1M3 is not valid in the LoweringState."

From Enabled-Lowering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the LoweringState."

From Enabled-Lowering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the LoweringState."

From Enabled-Lowering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the LoweringState."

From Enabled-Lowering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the LoweringState."

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParked}

Verify Lower Summary State
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Get To ParkedEngineering State
    [Tags]    functional
    Comment    Issue EnterEnginering Command.
    Issue EnterEngineering Command
    Comment    Verify system enters Parked Engineering State.
    Verify Summary State Event    ${SummaryEnabled}

Verify ParkedEngineering Detailed State
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering Detailed State.
    Verify Detailed State Event    ${DetailedParkedEngineering}

From Enabled-ParkedEnginering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the ParkedEngineeringState."

From Enabled-ParkedEnginering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the ParkedEngineeringState."

From Enabled-ParkedEnginering Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "LowerM1M3"    "The command LowerM1M3 is not valid in the ParkedEngineeringState."

From Enabled-ParkedEnginering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the ParkedEngineeringState."

From Enabled-ParkedEnginering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the ParkedEngineeringState."

From Enabled-ParkedEnginering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the ParkedEngineeringState."

Get To RaisingEngineering State
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify RaisingEngineering Detailed State
    [Tags]    functional
    Comment    Verify system enters RaisingEngineering Detailed State.
    Verify Detailed State Event    ${DetailedRaisingEngineering}

From Enabled-RaisingEngineering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the RaisingEngineeringState."

From Enabled-RaisingEngineering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the RaisingEngineeringState."

From Enabled-RaisingEngineering Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the RaisingEngineeringState."

From Enabled-RaisingEngineering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the RaisingEngineeringState."

From Enabled-RaisingEngineering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the RaisingEngineeringState."

From Enabled-RaisingEngineering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
   Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the RaisingEngineeringState."

From Enabled-RaisingEngineering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the RaisingEngineeringState."

Wait Until Engineering Raise Completes
    [Tags]    functional
    Comment    Verify system enters ActiveEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${13}
    Verify Summary State Event    ${2}

From Enabled-ActiveEngineering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the ActiveEngineeringState."

From Enabled-ActiveEngineering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the ActiveEngineeringState."

From Enabled-ActiveEngineering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the ActiveEngineeringState."

From Enabled-ActiveEngineering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the ActiveEngineeringState."

From Enabled-ActiveEngineering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the ActiveEngineeringState."

From Enabled-ActiveEngineering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the ActiveEngineeringState."

From Enabled-ActiveEngineering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the ActiveEngineeringState."

Get To LoweringEngineering State
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event    ${SummaryEnabled}

Verify LoweringEngineering Detailed State
    [Tags]    functional
    Comment    Verify system enters LoweringEngineering Detailed State.
    Verify Detailed State Event    ${DetailedLoweringEngineering}

From Enabled-LoweringEngineering Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Start"    "The command Start is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "EnterEngineering"    "The command EnterEngineering is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "ExitEngineering"    "The command ExitEngineering is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "RaiseM1M3"    "The command RaiseM1M3 is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "LowerM1M3"    "The command LowerM1M3 is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "AbortRaiseM1M3"    "The command AbortRaiseM1M3 is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Standby"    "The command Standby is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Enable"    "The command Enable is not valid in the LoweringEngineeringState."

From Enabled-LoweringEngineering Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command.
    Verify No Summary State Event
    Verify Command Rejection Warning    "Disable"    "The command Disable is not valid in the LoweringEngineeringState."

Wait Until LoweringEngineering Completes
    [Tags]    functional
    Comment    Verify system enters ParkedEngineering Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    ${DetailedParkedEngineering}

Verify LoweringEngineering Summary State
    [Tags]    functional
    Comment    Verify system enters Enabled Summary State.
    Verify Summary State Event    ${SummaryEnabled}

Cleanup - Disable
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    ${SummaryDisabled}

Verify System Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    Verify Detailed State Event    ${SummaryDisabled}

Cleanup - Standby
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data.SummaryState}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data.SummaryState}    ${SummaryStandby}

Verify System Standby Detailed State
    [Tags]    functional
    Comment    Verify system enters Standby Detailed State.
    Verify Detailed State Event    ${SummaryStandby}

*** Keywords ***
Verify No Summary State Event
    Comment    Commands are rejected silently, therefore Summary State Event is not published.
    ${valid}    ${data}=    Get Event Summary State
    Should Not Be True    ${valid}
