@echo off
setlocal

:: Check for correct number of arguments
if "%~4"=="" (
    echo Usage: %0 [MinAC] [MinDC] [MaxAC] [MaxDC]
    echo Example: %0 5 5 100 100
    exit /b
)

:: Assign command-line arguments to variables
set "MinAcState=%~1"
set "MinDcState=%~2"
set "MaxAcState=%~3"
set "MaxDcState=%~4"

:: Get the active power scheme GUID
for /f "tokens=4" %%a in ('powercfg /getactivescheme') do set "ActiveSchemeGUID=%%a"

:: GUIDs for CPU settings
set "MinProcessorStateGUID=893dee8e-2bef-41e0-89c6-b55d0929964c"
set "MaxProcessorStateGUID=bc5038f7-23e0-4960-96da-33abaf5935ec"

:: Apply Minimum Processor State settings for AC and DC
powercfg /setacvalueindex %ActiveSchemeGUID% SUB_PROCESSOR %MinProcessorStateGUID% %MinAcState%
powercfg /setdcvalueindex %ActiveSchemeGUID% SUB_PROCESSOR %MinProcessorStateGUID% %MinDcState%

:: Apply Maximum Processor State settings for AC and DC
powercfg /setacvalueindex %ActiveSchemeGUID% SUB_PROCESSOR %MaxProcessorStateGUID% %MaxAcState%
powercfg /setdcvalueindex %ActiveSchemeGUID% SUB_PROCESSOR %MaxProcessorStateGUID% %MaxDcState%

:: Activate the power plan to ensure changes take effect
powercfg /setactive %ActiveSchemeGUID%

echo CPU power settings updated successfully!

:end
endlocal
