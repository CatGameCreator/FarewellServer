echo updating...
cd "C:\Users\ivang\Documents\Farewell\FarewellServer"
git stash
git pull
git stash pop
timeout 2
run update.bat