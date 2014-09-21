rm -rf ~/.scripts

mkdir -p ~/.scripts

pushd ~/.scripts > /dev/null

git clone https://github.com/PerryBhandal/WindowSnapper.git

popd > /dev/null

cp snapWindow.sh ~/.scripts
cp authKey.sh ~/.scripts
cp takeScreenShot.sh ~/.scripts
