taskkill /im start.bat
wmic process where name="java.exe" CALL setpriority 128
wmic process where name="javaw.exe" CALL setpriority 128
if exist "C:\Users\ivang\Documents\Farewell\FarewellServer" (
  echo updating
  cd "C:\Users\ivang\Documents\Farewell\FarewellServer"
  git stash
  git pull
  git stash pop
) else (
  echo creating
  cd "C:\Users\ivang\Documents\Farewell" 
  git clone https://github.com/CatGameCreator/FarewellServer.git
  cd "C:\Users\ivang\Documents\Farewell\FarewellServer"
)
timeout 2
git diff --name-only HEAD origin/main | findstr /c:"update.bat" >nul
if %errorlevel% equ 0 (
    echo File was updated. Pulling changes...
    run reserve.bat
    exit
) else (
    echo File was not updated.
)
timeout 2
set "targetGUID=3ff9831b-6f80-4830-8178-736cd4229e7b"
for /f "tokens=2 delims=:" %%A in ('powercfg /getactivescheme') do (
    for /f "tokens=1" %%B in ("%%A") do set "currentGUID=%%B"
)
if /i "%currentGUID%"=="%targetGUID%" (
    echo The current power plan GUID is %targetGUID%.
) else (
    powercfg /import scheme.pow
    timeout 2
    powercfg /setactive 3ff9831b-6f80-4830-8178-736cd4229e7b
)
timeout 2
run start.bat

