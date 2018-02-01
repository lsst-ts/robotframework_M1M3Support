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

		self._hardpointSubnet = 5
		self._hardpointMonitorSubnet = 5
		# Configure Simulator to known state
		self.setToDefaults()

	def _afterCommand(self):
		time.sleep(1)

	def _subnetToUDPClient(self, subnet):
		if subnet == 1:
			return self._udpClientSubnetA
		elif subnet == 2:
			return self._udpClientSubnetB
		elif subnet == 3:
			return self._udpClientSubnetC
		elif subnet == 4:
			return self._udpClientSubnetD
		elif subnet == 5:
			return self._udpClientSubnetE
		raise ValueError()

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

	def setHardpointForceAndStatus(self, serverAddr, statusByte, ssiEncoderValue, loadCellForce):
		self._subnetToUDPClient(self._hardpointSubnet).send(self._ilcSim.forceAndStatusRequest(int(serverAddr), int(statusByte), int(ssiEncoderValue), float(loadCellForce)))

	def setHardpointDisplacementLVDT(self, serverAddr, lvdt1, lvdt2):
		self._subnetToUDPClient(self._hardpointMonitorSubnet).send(self._ilcSim.readLVDT(int(serverAddr), float(lvdt1), float(lvdt2)))

	def setHardpointDCAPressure(self, serverAddr, pressure1AxialPush, pressure2AxialPull, pressure3LateralPull, pressure4LateralPush):
		self._subnetToUDPClient(self._hardpointMonitorSubnet).send(self._ilcSim.readDcaPressureValues(int(serverAddr), float(pressure1AxialPush), float(pressure2AxialPull),
                            							float(pressure3LateralPull), float(pressure4LateralPush)))

	def setToDefaults(self):
		self._udpClientInclin.send(self._inclinSim.inclinometerResponse(degreesMeasured = 0.0))
		self._udpClientDisplace.send(self._displaceSim.displacementResponse(displace1 = 1.0,
											displace2 = 2.0,
											displace3 = 3.0,
											displace4 = 4.0,
											displace5 = 5.0,
											displace6 = 6.0,
											displace7 = 7.0,
											displace8 = 8.0))
		self.setHardpointForceAndStatus(serverAddr = 1, statusByte = 0, ssiEncoderValue = 1001, loadCellForce = 1.5)
		self.setHardpointForceAndStatus(serverAddr = 2, statusByte = 0, ssiEncoderValue = 1002, loadCellForce = 2.5)
		self.setHardpointForceAndStatus(serverAddr = 3, statusByte = 0, ssiEncoderValue = 1003, loadCellForce = 3.5)
		self.setHardpointForceAndStatus(serverAddr = 4, statusByte = 0, ssiEncoderValue = 1004, loadCellForce = 4.5)
		self.setHardpointForceAndStatus(serverAddr = 5, statusByte = 0, ssiEncoderValue = 1005, loadCellForce = 5.5)
		self.setHardpointForceAndStatus(serverAddr = 6, statusByte = 0, ssiEncoderValue = 1006, loadCellForce = 6.5)
		self.setHardpointDisplacementLVDT(serverAddr = 84, lvdt1 = -0.1, lvdt2 = 0.2)
		self.setHardpointDisplacementLVDT(serverAddr = 85, lvdt1 = -1.1, lvdt2 = 1.2)
		self.setHardpointDisplacementLVDT(serverAddr = 86, lvdt1 = -2.1, lvdt2 = 2.2)
		self.setHardpointDisplacementLVDT(serverAddr = 87, lvdt1 = -3.1, lvdt2 = 3.2)
		self.setHardpointDisplacementLVDT(serverAddr = 88, lvdt1 = -4.1, lvdt2 = 4.2)
		self.setHardpointDisplacementLVDT(serverAddr = 89, lvdt1 = -5.1, lvdt2 = 5.2)
		self.setHardpointDCAPressure(serverAddr = 84, pressure1AxialPush = 0.1, pressure2AxialPull = 0.0, pressure3LateralPull = 0.0, pressure4LateralPush = 0.0)
		self.setHardpointDCAPressure(serverAddr = 85, pressure1AxialPush = 1.1, pressure2AxialPull = 0.0, pressure3LateralPull = 0.0, pressure4LateralPush = 0.0)
		self.setHardpointDCAPressure(serverAddr = 86, pressure1AxialPush = 2.1, pressure2AxialPull = 0.0, pressure3LateralPull = 0.0, pressure4LateralPush = 0.0)
		self.setHardpointDCAPressure(serverAddr = 87, pressure1AxialPush = 3.1, pressure2AxialPull = 0.0, pressure3LateralPull = 0.0, pressure4LateralPush = 0.0)
		self.setHardpointDCAPressure(serverAddr = 88, pressure1AxialPush = 4.1, pressure2AxialPull = 0.0, pressure3LateralPull = 0.0, pressure4LateralPush = 0.0)
		self.setHardpointDCAPressure(serverAddr = 89, pressure1AxialPush = 5.1, pressure2AxialPull = 0.0, pressure3LateralPull = 0.0, pressure4LateralPush = 0.0)	
