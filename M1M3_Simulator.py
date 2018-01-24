import time
import sys
import numpy
import ILCSimulator
import InclinometerSimulator
import DisplaceSimulator
import AccelSimulator
import UDP

class M1M3_Simulator:
	ROBOT_LIBRARY_SCOPE = 'GLOBAL'

	def __init__(self):
		self._ilcSim = ILCSimulator.ILCSimulator()
		self._inclinSim = InclinometerSimulator.InclinometerSimulator()
		self._displaceSim = DisplaceSimulator.DisplacementSimulator()
		self._accelSim = AccelSimulator.AccelSimulator()
		ipAddress = '140.252.24.124'
		self._udpClientSubnetA = UDP.UDP(ipAddress, 5006)
		self._udpClientSubnetB = UDP.UDP(ipAddress, 5007)
		self._udpClientSubnetC = UDP.UDP(ipAddress, 5008)
		self._udpClientSubnetD = UDP.UDP(ipAddress, 5009)
		self._udpClientSubnetE = UDP.UDP(ipAddress, 5005)
		self._udpClientInclin = UDP.UDP(ipAddress, 5010)
		self._udpClientDisplace = UDP.UDP(ipAddress, 5011)
		self._udpClientAccel = UDP.UDP(ipAddress, 5012)
		# Configure Simulator to known state
		self._udpClientInclin.send(self._inclinSim.inclinometerResponse(degreesMeasured = 0.0))
		self._udpClientDisplace.send(self._displaceSim.displacementResponse(displace1 = 1.0, 
											displace2 = 2.0, 
											displace3 = 3.0, 
											displace4 = 4.0, 
											displace5 = 5.0, 
											displace6 = 6.0, 
											displace7 = 7.0, 
											displace8 = 8.0))

	def _afterCommand(self):
		time.sleep(1)

	def setInclinometer(self, value=0.0):
		self._udpClientInclin.send(self._inclinSim.inclinometerResponse(degreesMeasured = value))
		self._afterCommand()

	def setDisplacement(self, dispA=1.0, dispB=2.0, dispC=3.0, dispD=4.0, dispE=5.0, dispF=6.0, dispG=7.0, dispH=8.0):
		self._udpClientDisplace.send(self._displaceSim.displacementResponse(displace1 = dispA, 
											displace2 = dispB, 
											displace3 = dispC, 
											displace4 = dispD, 
											displace5 = dispE, 
											displace6 = dispF, 
											displace7 = dispG, 
											displace8 = dispH))
		self._afterCommand()
