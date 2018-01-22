import time
import sys
import numpy
import ILCSimulator
import InclinometerSimulator
#import DisplaceSimulator
import AccelSimulator
import UDP

class M1M3_Simulator:
	ROBOT_LIBRARY_SCOPE = 'GLOBAL'

	def __init__(self):
		sys.__stdout__.write("Initializing UDP...")
		self._ilcSim = ILCSimulator.ILCSimulator()
		self._inclinSim = InclinometerSimulator.InclinometerSimulator()
		#self._displaceSim = DisplaceSimulator.DisplacementSimulator()
		self._accelSim = AccelSimulator.AccelSimulator()
		sys.__stdout__.write("33%...")
		ipAddress = '140.252.24.124'
		self._udpClientSubnetA = UDP.UDP(ipAddress, 5006)
		self._udpClientSubnetB = UDP.UDP(ipAddress, 5007)
		self._udpClientSubnetC = UDP.UDP(ipAddress, 5008)
		self._udpClientSubnetD = UDP.UDP(ipAddress, 5009)
		self._udpClientSubnetE = UDP.UDP(ipAddress, 5005)
		self._udpClientInclin = UDP.UDP(ipAddress, 5010)
		#self._udpClientDisplace = UDP.UDP(ipAddress, 5011)
		self._udpClientAccel = UDP.UDP(ipAddress, 5012)
		sys.__stdout__.write("67%...")
		# Configure Simulator to known state
		self._udpClientInclin.send(self._inclinSim.inclinometerResponse(degreesMeasured = 0.0))
		sys.__stdout__.write("100%\n")

	def _afterCommand(self):
		time.sleep(1)

	def setInclinometer(self, value=0.0):
		self._udpClientInclin.send(self._inclinSim.inclinometerResponse(degreesMeasured = value))
		self._afterCommand()
