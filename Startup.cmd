:: Name:      Startup.cmd
:: Purpose:   Initializes a Windows command prompt shell
:: Author:    stevejansen_github@mac.com
:: Revision:  April 2012

@ECHO OFF
SETLOCAL ENABLEEXTENSIONS

:: self-install this script, but, don't force an overwrite if an auto run script is already configured
IF /I "%~1"=="/install" (
    ECHO %~n0: installing %~nx0 as the cmd.exe auto-run script
    REG ADD "HKCU\Software\Microsoft\Command Processor" /v "AutoRun" /t REG_EXPAND_SZ /d "^"%~f0^""
)

::CHECK if arguments were passed to cmd.exe, if so exit this script
FOR /F "tokens=2" %%I IN ("%CMDCMDLINE%") DO (
  IF NOT "%%I"=="" (
    ECHO.[%DATE% %TIME%] - AutoRun Disabled - %CMDCMDLINE%  >> "%USERPROFILE%\Documents\Scripts\%~n0.history.txt"
    GOTO :EOF
  ) ELSE (
    ECHO.[%DATE% %TIME%] - AutoRun Enabled  - %CMDCMDLINE% >> "%USERPROFILE%\Documents\Scripts\%~n0.history.txt"
  )
)

:: update the path as needed
PATH %PATH%;%ProgramFiles%\SysInternals;

:: Load the DOSKEY macros from ".txt" file in the same folder and same filename as this script
START "" /B DOSKEY /MACROFILE="d:\bashrc"

:: change the working directory
:: IF EXIST D:\ PUSHD D:\

@ECHO ON
@EXIT /B 0