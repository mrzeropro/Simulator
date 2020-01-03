rem Robot controller for EY
taskkill /IM aproc.exe /F
taskkill /IM SIM_FFU_A.exe /F
taskkill /IM RA_Simu.exe /F
taskkill /IM stg540.exe /F
taskkill /IM DLLTester.exe /F
taskkill /IM simulator.exe /F

rem "Stopping Log Server"
taskkill /IM logsrv.exe