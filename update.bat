taskkill /im start.bat
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
)
timeout 5
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
py main.py

