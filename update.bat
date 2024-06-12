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
timeout 10
call start.bat
