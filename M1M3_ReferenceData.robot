*** Settings ***

*** Variables ***
${hardpointMonitorTable} = [
#DataIndex, ActuatorID, Subnet, ServerAddress
[0, 11, 5, 84],
[1, 12, 5, 85],
[2, 13, 5, 86],
[3, 14, 5, 87],
[4, 15, 5, 88],
[5, 16, 5, 89],
]

${hardpointActuatorTable} = [
#DataIndex, ActuatorID, Subnet, ServerAddress
[0,1,5,1],
[1,2,5,2],
[2,3,5,3],
[3,4,5,4],
[4,5,5,5],
[5,6,5,6],
]

${dataIndexCol}		0
${actuatorIdCol}	1
${subnetCol}		2
${serverAddressCol}	3
