rm -rf ~/.scripts

mkdir -p ~/.scripts

pushd ~/.scripts > /dev/null

git clone https://github.com/PerryBhandal/WindowSnapper.git
git clone https://github.com/PerryBhandal/HostsManager.git

popd > /dev/null

cp snapWindow.sh ~/.scripts
cp authKey.sh ~/.scripts
cp takeScreenShot.sh ~/.scripts
cp hostsManagerConfig.rb ~/.scripts/HostsManager/config.rb
cp wifiKeyboard.sh ~/.scripts
