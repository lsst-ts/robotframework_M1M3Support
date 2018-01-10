import time
import sys
import numpy
from SALPY_m1m3 import *
import ILCSimulator
import InclinometerSimulator
import DisplaceSimulator
import AccelSimulator
import UDP

OfflineState             = 0x00000000
StandbyState             = 0x01000000
DisabledState            = 0x02000000
EnabledState             = 0x03000000
ParkedState              = 0x03000001
RaisingState             = 0x03000002
ActiveState              = 0x03000003
LoweringState            = 0x03000004
EngineeringState         = 0x03010000
ParkedEngineeringState   = 0x03010001
RaisingEngineeringState  = 0x03010002
ActiveEngineeringState   = 0x03010003
LoweringEngineeringState = 0x03010004
FaultState               = 0xFFFFFFFF

def subnetToUDPClient(subnet):
    if subnet == 1:
        return udpClientSubnetA
    elif subnet == 2:
        return udpClientSubnetB
    elif subnet == 3:
        return udpClientSubnetC
    elif subnet == 4:
        return udpClientSubnetD
    elif subnet == 5:
        return udpClientSubnetE
    raise ValueError()

def checkEquals(actual, expected, description):
    result = actual == expected
    print("%s : %s" % (description, result))
    return result
    
def checkInTolerance(actual, expected, tolerance, description):
    result = actual >= (expected - tolerance) and actual <= (expected + tolerance)
    print("%s: %s" % (description, result))
    return result
    
def afterCommand():
    time.sleep(1)
    
def issueStartCommand():
    #print("-- Start Command")
    data = m1m3_command_StartC()
    data.Start = True
    data.SettingsToApply = "Default"
    cmdId = salM1M3.issueCommand_Start(data)
    salM1M3.waitForCompletion_Start(cmdId, 10)
    afterCommand()
    
def issueEnableCommand():
    #print("-- Enable Command")
    data = m1m3_command_EnableC()
    data.Enable = True
    cmdId = salM1M3.issueCommand_Enable(data)
    salM1M3.waitForCompletion_Enable(cmdId, 10)
    afterCommand()
    
def issueEnterEngineeringCommand():
    #print("-- Enter Engineering Command")
    data = m1m3_command_EnterEngineeringC()
    data.EnterEngineering = True
    cmdId = salM1M3.issueCommand_EnterEngineering(data)
    salM1M3.waitForCompletion_EnterEngineering(cmdId, 10)
    afterCommand()

def issueRaiseM1M3Command():
    #print("-- Raise M1M3 Command")
    data = m1m3_command_RaiseM1M3C()
    data.RaiseM1M3 = True
    cmdId = salM1M3.issueCommand_RaiseM1M3(data)
    salM1M3.waitForCompletion_RaiseM1M3(cmdId, 10)
    afterCommand()
    
def issueAbortRaiseM1M3Command():
    #print("-- Abort Raise M1M3 Command")
    data = m1m3_command_AbortRaiseM1M3C()
    data.AbortRaiseM1M3 = True
    cmdId = salM1M3.issueCommand_AbortRaiseM1M3(data)
    salM1M3.waitForCompletion_AbortRaiseM1M3(cmdId, 10)
    afterCommand()
    
def issueLowerM1M3Command():
    #print("-- Lower M1M3 Command")
    data = m1m3_command_LowerM1M3C()
    data.LowerM1M3 = True
    cmdId = salM1M3.issueCommand_LowerM1M3(data)
    salM1M3.waitForCompletion_LowerM1M3(cmdId, 10)
    afterCommand()
    
def issueExitEngineeringCommand():
    #print("-- Exit Engineering Command")
    data = m1m3_command_ExitEngineeringC()
    data.ExitEngineering = True
    cmdId = salM1M3.issueCommand_ExitEngineering(data)
    salM1M3.waitForCompletion_ExitEngineering(cmdId, 10)
    afterCommand()
    
def issueDisableCommand():
    #print("-- Disable Command")
    data = m1m3_command_DisableC()
    data.Disable = True
    cmdId = salM1M3.issueCommand_Disable(data)
    salM1M3.waitForCompletion_Disable(cmdId, 10)
    afterCommand()
    
def issueStandbyCommand():
    #print("-- Standby Command")
    data = m1m3_command_StandbyC()
    data.Standby = True
    cmdId = salM1M3.issueCommand_Standby(data)
    salM1M3.waitForCompletion_Standby(cmdId, 10)
    afterCommand()
    
def issueShutdownCommand():
    #print("-- Shutdown Command")
    data = m1m3_command_ShutdownC()
    data.Shutdown = True
    cmdId = salM1M3.issueCommand_Shutdown(data)
    salM1M3.waitForCompletion_Shutdown(cmdId, 10)
    afterCommand()
    
def checkInclinometerEquals(expected, tolerance, description):
    data = m1m3_InclinometerDataC()
    retVal = salM1M3.getSample_InclinometerData(data)
    if retVal == 0:
        return checkInTolerance(data.InclinometerAngle, expected, tolerance, description)
    else:
        print("%s : NO DATA AVAILABLE" % description)
    
def checkSummaryStateEquals(expected, description):
    data = m1m3_logevent_SummaryStateC()
    salM1M3.getEvent_SummaryState(data)
    return checkEquals(data.SummaryState, expected, description)
    
def checkNoSummaryState(description):
    data = m1m3_logevent_SummaryStateC()
    retValue = salM1M3.getEvent_SummaryState(data)
    result = retValue != 0
    print("%s : %s" % (description, result))
    return result
    
def waitForSummaryStateEquals(expected, timeout, description):
    startTime = time.time()
    data = m1m3_logevent_SummaryStateC()
    while True:
        retVal = salM1M3.getEvent_SummaryState(data)
        if retVal == 0:
            if data.SummaryState == expected:
                return checkEquals(data.SummaryState, expected, description)
        elif (time.time() - startTime) >= timeout:
            return checkEquals(data.SummaryState, expected, description)
