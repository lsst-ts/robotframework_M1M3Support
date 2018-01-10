import time
from SALPY_m1m3 import *

class Commands:

	def __init__(self):
		self._SALM1M3 = SAL_m1m3()
		self._SALM1M3.setDebugLevel(0)
		self._SALM1M3.salCommand("m1m3_command_Start")
		self._SALM1M3.salCommand("m1m3_command_Standby")
		self._SALM1M3.calEvent("m1m3_logevent_SummaryState")

	def _afterCommand(self):
		time.sleep(1)

	def issueStartCommand(self):
		data = m1m3_command_StartC()
		data.Start = True
		data.SettingsToApply = "Default"
		cmdId = self._SALM1M3.issueCommand_Start(data)
		self._SALM1M3.waitForCompletion_Start(cmdId, 10)
		self._afterCommand()
    
	def issueStandbyCommand(self):
		data = m1m3_command_StandbyC()
		data.Standby = True
		cmdId = self._SALM1M3.issueCommand_Standby(data)
		self._SALM1M3.waitForCompletion_Standby(cmdId, 10)
		afterCommand()

	def getEventSummaryState(self):
		data = m1m3_logevent_SummaryStateC()
		retVal = self._SALM1M3.getEvent_SummaryState(data)
		return retVal==0, data
