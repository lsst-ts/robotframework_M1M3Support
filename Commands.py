import sys
import time
from SALPY_m1m3 import *

class Commands:
	ROBOT_LIBRARY_SCOPE = 'GLOBAL'

	def __init__(self):
		sys.__stdout__.write("Initializing SAL...\n")
		self._SALM1M3 = SAL_m1m3()
		self._SALM1M3.setDebugLevel(0)
		self._SALM1M3.salTelemetrySub("m1m3_logevent_SummaryState")
		self._SALM1M3.salTelemetrySub("m1m3_logevent_DetailedState")
		self._SALM1M3.salCommand("m1m3_command_Start")
		self._SALM1M3.salCommand("m1m3_command_Standby")
		self._SALM1M3.salCommand("m1m3_command_Enable")
		self._SALM1M3.salCommand("m1m3_command_Disable")
		self._SALM1M3.salCommand("m1m3_command_RaiseM1M3")
		self._SALM1M3.salCommand("m1m3_command_AbortRaiseM1M3")
		self._SALM1M3.salCommand("m1m3_command_LowerM1M3")
		self._SALM1M3.salCommand("m1m3_command_EnterEngineering")
		self._SALM1M3.salCommand("m1m3_command_ExitEngineering")

	def _afterCommand(self):
		time.sleep(1)

	def issueStartCommand(self):
		data = m1m3_command_StartC()
		data.Start = True
		data.SettingsToApply = "Default"
		cmdId = self._SALM1M3.issueCommand_Start(data)
		self._SALM1M3.waitForCompletion_Start(cmdId, 10)
		self._afterCommand()

	def issueEnableCommand(self):
		data = m1m3_command_EnableC()
		data.Enable = True
		cmdId = self._SALM1M3.issueCommand_Enable(data)
		self._SALM1M3.waitForCompletion_Enable(cmdId, 10)
		self._afterCommand()

	def issueRaiseCommand(self):
		data = m1m3_command_RaiseM1M3C()
		data.RaiseM1M3 = True
		cmdId = self._SALM1M3.issueCommand_RaiseM1M3(data)
		self._SALM1M3.waitForCompletion_RaiseM1M3(cmdId, 10)
		self._afterCommand()

	def issueAbortRaiseCommand(self):
		data = m1m3_command_AbortRaiseM1M3C()
		data.AbortRaiseM1M3 = True
		cmdId = self._SALM1M3.issueCommand_AbortRaiseM1M3(data)
		self._SALM1M3.waitForCompletion_AbortRaiseM1M3(cmdId, 10)
		self._afterCommand()

	def issueLowerCommand(self):
		data = m1m3_command_LowerM1M3C()
		data.LowerM1M3 = True
		cmdId = self._SALM1M3.issueCommand_LowerM1M3(data)
		self._SALM1M3.waitForCompletion_LowerM1M3(cmdId, 10)
		self._afterCommand()

	def issueEnterEngineeringCommand(self):
		data = m1m3_command_EnterEngineeringC()
		data.EnterEngineering = True
		cmdId = self._SALM1M3.issueCommand_EnterEngineering(data)
		self._SALM1M3.waitForCompletion_EnterEngineering(cmdId, 10)
		self._afterCommand()

	def issueExitEngineeringCommand(self):
		data = m1m3_command_ExitEngineeringC()
		data.ExitEngineering = True
		cmdId = self._SALM1M3.issueCommand_ExitEngineering(data)
		self._SALM1M3.waitForCompletion_ExitEngineering(cmdId, 10)
		self._afterCommand()

	def issueDisableCommand(self):
		data = m1m3_command_DisableC()
		data.Disable = True
		cmdId = self._SALM1M3.issueCommand_Disable(data)
		self._SALM1M3.waitForCompletion_Disable(cmdId, 10)
		self._afterCommand()
    
	def issueStandbyCommand(self):
		data = m1m3_command_StandbyC()
		data.Standby = True
		cmdId = self._SALM1M3.issueCommand_Standby(data)
		self._SALM1M3.waitForCompletion_Standby(cmdId, 10)
		self._afterCommand()

	def getEventSummaryState(self):
		data = m1m3_logevent_SummaryStateC()
		retVal = self._SALM1M3.getEvent_SummaryState(data)
		return retVal==0, data.SummaryState

	def getEventDetailedState(self):
		data = m1m3_logevent_DetailedStateC()	
		retVal = self._SALM1M3.getEvent_DetailedState(data)
		return retVal==0, data.DetailedState

	def waitForNextSummaryState(self, wait=300):
		timeout = time.time() + float(wait)
		data = m1m3_logevent_SummaryStateC()
		retVal = self._SALM1M3.getEvent_SummaryState(data)
		while retVal != 0 and timeout > time.time():
			time.sleep(1)
			retVal = self._SALM1M3.getEvent_SummaryState(data)
		return retVal==0, data.SummaryState

	def waitForNextDetailedState(self, wait=300):
		timeout = time.time() + float(wait)
		data = m1m3_logevent_DetailedStateC()
		retVal = self._SALM1M3.getEvent_DetailedState(data)
		while retVal != 0 and timeout > time.time():
			time.sleep(1)
			retVal = self._SALM1M3.getEvent_DetailedState(data)
		return retVal==0, data.DetailedState

	def __del__(self):
		self._SALM1M3.salShutdown()
