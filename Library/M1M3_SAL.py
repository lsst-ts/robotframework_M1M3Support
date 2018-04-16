import sys
import time
from SALPY_m1m3 import *

class M1M3_SAL:
	ROBOT_LIBRARY_SCOPE = 'GLOBAL'

	def __init__(self):
		self._SALM1M3 = SAL_m1m3()
		self._SALM1M3.setDebugLevel(0)
		## SAL Events
		self._SALM1M3.salEvent("m1m3_logevent_SummaryState")
		self._SALM1M3.salEvent("m1m3_logevent_DetailedState")
		self._SALM1M3.salEvent("m1m3_logevent_SettingsApplied")
		self._SALM1M3.salEvent("m1m3_logevent_HardpointMonitorInfo")
		self._SALM1M3.salEvent("m1m3_logevent_ForceActuatorInfo")
		self._SALM1M3.salEvent("m1m3_logevent_ForceActuatorState")
		self._SALM1M3.salEvent("m1m3_logevent_CommandRejectionWarning")
		## SAL Commands
		self._SALM1M3.salCommand("m1m3_command_Start")
		self._SALM1M3.salCommand("m1m3_command_Standby")
		self._SALM1M3.salCommand("m1m3_command_Enable")
		self._SALM1M3.salCommand("m1m3_command_Disable")
		self._SALM1M3.salCommand("m1m3_command_RaiseM1M3")
		self._SALM1M3.salCommand("m1m3_command_AbortRaiseM1M3")
		self._SALM1M3.salCommand("m1m3_command_LowerM1M3")
		self._SALM1M3.salCommand("m1m3_command_EnterEngineering")
		self._SALM1M3.salCommand("m1m3_command_ExitEngineering")
		## SAL Telemetry
		self._SALM1M3.salTelemetrySub("m1m3_InclinometerData")
		self._SALM1M3.salTelemetrySub("m1m3_IMSData")
		self._SALM1M3.salTelemetrySub("m1m3_HardpointActuatorData")
		self._SALM1M3.salTelemetrySub("m1m3_HardpointMonitorData")
		self._SALM1M3.salTelemetrySub("m1m3_ForceActuatorData")

	def _afterCommand(self):
		time.sleep(1)

	def getCurrentTime(self):
		data = self._SALM1M3.getCurrentTime()
		return data

	######## M1M3 Telemetry ########

	def getSampleInclinometerData(self):
		data = m1m3_InclinometerDataC()
		retVal = self._SALM1M3.getSample_InclinometerData(data)
		return retVal == 0, data.Timestamp, data.InclinometerAngle

	def getNextSampleInclinometerData(self):
		data = m1m3_InclinometerDataC()
		retVal = self._SALM1M3.getNextSample_InclinometerData(data)
		return retVal == 0, data.Timestamp, data.InclinometerAngle

	def getSampleIMSData(self):
		data = m1m3_IMSDataC()
		retVal = self._SALM1M3.getSample_IMSData(data)
		return retVal == 0, data

	def getSampleHardpointMonitorData(self):
		data = m1m3_HardpointMonitorDataC()
		retVal = self._SALM1M3.getSample_HardpointMonitorData(data)
		return retVal == 0, data

	def getSampleHardpointActuatorData(self):
		data = m1m3_HardpointActuatorDataC()
		retVal = self._SALM1M3.getSample_HardpointActuatorData(data)
		return retVal == 0, data

	def getSampleForceActuatorData(self):
		data = m1m3_ForceActuatorDataC()
		retVal = self._SALM1M3.getSample_ForceActuatorData(data)
		return retVal == 0, data

	######## M1M3 Commands ########

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

	######## M1M3 Events ########

	def getEventSummaryState(self):
		data = m1m3_logevent_SummaryStateC()
		retVal = self._SALM1M3.getEvent_SummaryState(data)
		return retVal==0, data

	def getEventDetailedState(self):
		data = m1m3_logevent_DetailedStateC()	
		retVal = self._SALM1M3.getEvent_DetailedState(data)
		return retVal==0, data

	def getEventSettingsApplied(self):
		data = m1m3_logevent_SettingsAppliedC()
		retVal = self._SALM1M3.getEvent_SettingsApplied(data)
		return retVal==0, data.Settings

	def getEventHardpointMonitorInfo(self):
		data = m1m3_logevent_HardpointMonitorInfoC()
		retVal = self._SALM1M3.getEvent_HardpointMonitorInfo(data)
		return retVal==0, data

	def getEventHardpointActuatorInfo(self):
		data = m1m3_logevent_HardpointActuatorInfoC()
		retVal = self._SALM1M3.getEvent_HardpointActuatorInfo(data)
		return retVal==0, data

	def getEventForceActuatorInfo(self):
		data = m1m3_logevent_ForceActuatorInfoC()
		retVal = self._SALM1M3.getEvent_ForceActuatorInfo(data)
		return retVal==0, data

	def getEventForceActuatorState(self):
		data = m1m3_logevent_ForceActuatorStateC()
		retVal = self._SALM1M3.getEvent_ForceActuatorState(data)
		return retVal==0, data

	def getEventCommandRejectionWarning(self):
		data = m1m3_logevent_CommandRejectionWarningC()
		retVal = self._SALM1M3.getEvent_CommandRejectionWarning(data)
		return retVal==0, data

	######## Flush Topics ########
	
	def flushHardpointMonitorInfo(self):
		data = m1m3_logevent_HardpointMonitorInfoC()
		retVal = self._SALM1M3.flushSamples_logevent_HardpointMonitorInfo(data)
		return retVal==0

	def flushHardpointActuatorInfo(self):
		data = m1m3_logevent_HardpointActuatorInfoC()
		retVal = self._SALM1M3.flushSamples_logevent_HardpointActuatorInfo(data)
		return retVal==0

	def flushForceActuatorInfo(self):
		data = m1m3_logevent_ForceActuatorInfoC()
		retVal = self._SALM1M3.flushSamples_logevent_ForceActuatorInfo(data)
		return retVal==0

	######## Utility Functions ########

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
