if exist "C:\Users\ivang\OneDrive\Документы\Farewell Server" (
  echo updating
  cd "C:\Users\ivang\OneDrive\Документы\Farewell Server"
  git pull
) else (
  echo creating
  cd "C:\Users\ivang\OneDrive\Документы\Farewell Server" 
  git clone https://github.com/CatGameCreator/FarewellSMPServer.git
)