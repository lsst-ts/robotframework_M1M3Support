*** Settings ***
Documentation    Test invalid M1M3 State transitions.
Force Tags    
Suite Setup
Library    String
Library    Commands
Resource    Global_Vars.robot

*** Test Cases ***
From Standby Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Standby Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Standby Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Standby Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Standby Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Standby Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Standby Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Standby Issue Standby Command
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

Get To Disabled State
    [Tags]    functional
    Comment    Issue Start Command.
    Issue Start Command
    Comment    Verify system enters Disabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    2

Verify Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    ${valid}    ${data}=    Get Event Detailed State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    2

From Disabled Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Disabled Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Disabled Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Disabled Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Disabled Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Disabled Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Disabled Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

Get To Enabled State
    [Tags]    functional
    Comment    Issue Enable Command.
    Issue Enable Command
    Comment    Verify system enters Enabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    3

Verify Parked Detailed State
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    ${valid}    ${data}=    Get Event Detailed State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    5

From Enabled-Parked Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Parked Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Parked Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Parked Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Parked Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Parked Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

Get To Raising State
    [Tags]    functional
    Comment    Issue Raise Command.
    Issue Raise Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event Enabled

Verify Raising Detailed State
    [Tags]    functional
    Comment    Verify system enters Raising Detailed State.
    ${valid}    ${data}=    Get Event Detailed State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    6

From Enabled-Raising Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Raising Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Raising Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Raising Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Raising Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Raising Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Raising Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

Wait Until Raise Completes
    [Tags]    functional
    Comment    Verify system enters Active Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    7
    Verify Summary State Event Enabled

From Enabled-Active Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Active Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Active Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Active Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Active Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Active Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Active Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

Get To Lowering State
    [Tags]    functional
    Comment    Issue Lower Command.
    Issue Lower Command
    Comment    Verify system enters Enabled State.
    Verify Summary State Event Enabled

Verify Lowering Detailed State
    [Tags]    functional
    Comment    Verify system enters Lowering Detailed State.
    ${valid}    ${data}=    Get Event Detailed State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    8

From Enabled-Lower Issue Start Command
    [Tags]    functional
    Issue Start Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue EnterEngineering Command
    [Tags]    functional
    Issue EnterEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue ExitEngineering Command
    [Tags]    functional
    Issue ExitEngineering Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue Raise Command
    [Tags]    functional
    Issue Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue Lower Command
    [Tags]    functional
    Issue Lower Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue Abort Raise Command
    [Tags]    functional
    Issue Abort Raise Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue Standby Comamnd
    [Tags]    functional
    Issue Standby Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue Enable Command
    [Tags]    functional
    Issue Enable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

From Enabled-Lower Issue Disable Command
    [Tags]    functional
    Issue Disable Command
    Comment    Verify system rejects the command
    Verify No Summary State Event

Wait Until Lower Completes
    [Tags]    functional
    Comment    Verify system enters Parked Detailed State.
    ${valid}    ${data}=    Wait For Next Detailed State    ${300}
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    5
    Verify Summary State Event Enabled

Cleanup - Disable
    [Tags]    functional
    Comment    Issue Disable Command.
    Issue Disable Command
    Comment    Verify system enters Disabled State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    2

Verify System Disabled Detailed State
    [Tags]    functional
    Comment    Verify system enters Disabled Detailed State.
    ${valid}    ${data}=    Get Event Detailed State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    2
Cleanup - Standby
    [Tags]    functional
    Comment    Issue Standby Command.
    Issue Standby Command
    Comment    Verify system enters Standby State.
    ${valid}    ${data}=    Get Event Summary State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    1

Verify System Standby Detailed State
    [Tags]    functional
    Comment    Verify system enters Standby Detailed State.
    ${valid}    ${data}=    Get Event Detailed State
    Log    ${valid}
    Log    ${data}
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    1
*** Keywords ***
Verify No Summary State Event
    Comment    Commands are rejected silently, therefore Summary State Event is not published.
    ${valid}    ${data}=    Get Event Summary State
    Should Not Be True    ${valid}

Verify Summary State Event Enabled
    Comment    Every sub-State transition triggers a Summary State Event for the Enabled State.
    ${valid}    ${data}=    Get Event Summary State
    Should Be True    ${valid}
    Should Be Equal As Integers    ${data}    3
