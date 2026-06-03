@REM Licensed to the Apache Software Foundation (ASF)
@REM Maven wrapper script for Windows

@echo off
setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.

pushd %DIRNAME%\..
set BASEDIR=%CD%
popd

REM Read maven wrapper properties
if exist "%BASEDIR%\.mvn\wrapper\maven-wrapper.properties" (
    for /f "delims=" %%i in (%BASEDIR%\.mvn\wrapper\maven-wrapper.properties) do set %%i
)

if not defined MAVEN_VERSION set MAVEN_VERSION=3.9.6

REM Check if Maven is available
if exist "%BASEDIR%\.mvn\mvn-%MAVEN_VERSION%\bin\mvn.cmd" (
    set MVN_CMD=%BASEDIR%\.mvn\mvn-%MAVEN_VERSION%\bin\mvn.cmd
) else (
    if exist "%BASEDIR%\.mvn\mvn-%MAVEN_VERSION%\bin\mvn.bat" (
        set MVN_CMD=%BASEDIR%\.mvn\mvn-%MAVEN_VERSION%\bin\mvn.bat
    ) else (
        REM Try to use Maven from PATH
        where mvn >nul 2>nul
        if %ERRORLEVEL% equ 0 (
            set MVN_CMD=mvn
        ) else (
            echo Maven not found. Please install Maven or run this script in an environment where Maven is available.
            exit /b 1
        )
    )
)

%MVN_CMD% %*
