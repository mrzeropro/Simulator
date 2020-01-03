$robotArms = $args[0]
$ffuVersion = $args[1]
if ($robotArms -eq 2){
    Copy-Item "aproc\aproc_PPC.ini" "aproc\aproc.ini"
    Copy-Item "aproc\pos_PPC.dat" "aproc\pos.dat"
    $robotPath = "..\Sim_RR73B00_01030test_PPC"
}
else{
    Copy-Item "aproc\aproc_CMP.ini" "aproc\aproc.ini"
    Copy-Item "aproc\pos_CMP.dat" "aproc\pos.dat"
    $robotPath = "..\Sim_RR73B00_01030test_CMP"
}

if ($ffuVersion -eq 2){
    $ffuPath = "FFUController_SIM_CommSpec2.00"
}
else{
    $ffuPath = "FFUController_SIM"
}
Start-Process -FilePath "aproc\aproc.exe" -WindowStyle Minimized
Start-Process -FilePath "logsrv\logsrv.exe" -WindowStyle Minimized
Start-Process -FilePath "RA_Simu\RA_Simu.exe" -WindowStyle Minimized
Set-Location -Path $ffuPath

Start-Process -FilePath "SIM_FFU_A.exe" -WindowStyle Minimized
Start-Sleep -s 1
Set-Location -Path $robotPath
Start-Process -FilePath "simulator.exe" -WindowStyle Minimized
Start-Sleep -s 1
Set-Location -Path "..\LP_Simulator\Port1"
Start-Process -FilePath "stg540.exe" -WindowStyle Minimized
Start-Sleep -s 1
Set-Location -Path "..\Port2"
Start-Process -FilePath "stg540.exe" -WindowStyle Minimized
Start-Sleep -s 1
Set-Location -Path "..\Port3"
Start-Process -FilePath "stg540.exe" -WindowStyle Minimized
Set-Location -Path "..\.."