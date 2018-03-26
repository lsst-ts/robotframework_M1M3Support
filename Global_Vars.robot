*** Settings ***

*** Variables ***
${ContInt}       		false
${UserName}      		tsswtest
${PassWord}      		${EMPTY}
${KeyFile}       		${EMPTY}
${SALInstall}    		/opt/sal
${SALHome}       		${SalInstall}/lsstsal
${SALWorkDir}    		${SalInstall}/test
${SALVersion}    		3.0
${OpenspliceVersion}		6.7.170523OSS
${OpenspliceDate}		2017-06-21
${Prompt}        		]$
${Host}          		0.0.0.0
##### State Enumerations #####
${SummaryDisabled}		1
${SummaryEnabled}		2
${SummaryFault}			3
${SummaryOffline}		4
${SummaryStandby}		5

${DetailedDisabled}		1
${DetailedEnabled}		2
${DetailedFault}		3
${DetailedOffline}		4
${DetailedStandby}		5
${DetailedParked}		6
${DetailedRaising}		7
${DetailedActive}		8
${DetailedLowering}		9
${DetailedEngineering}		10
${DetailedParkedEngineering}	11
${DetailedRaisingEngineering}	12
${DetailedActiveEngineering}	13
${DetailedLoweringEngineering}	14
${DetaileLoweringFault}		15
${DetailedHardpointCorrection}	16
