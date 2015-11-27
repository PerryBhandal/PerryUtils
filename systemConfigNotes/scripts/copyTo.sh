rm -rf ~/.scripts

mkdir -p ~/.scripts

pushd ~/.scripts > /dev/null

git clone git://github.com/ssokolow/quicktile
git clone https://github.com/PerryBhandal/HostsManager.git

popd > /dev/null

cp snapWindow.sh ~/.scripts
cp authKey.sh ~/.scripts
cp takeScreenShot.sh ~/.scripts
cp hostsManagerConfig.rb ~/.scripts/HostsManager/config.rb
cp wifiKeyboard.sh ~/.scripts
cp track_time.py ~/.scripts/
cp gitNoComment.sh ~/.scripts/
cp commitJunkRepo.sh ~/.scripts/
cp site_snap.rb ~/.scripts/
cp gen_base.rb ~/.scripts/
cp -r doc_base ~/.scripts/

# Above cp calls are redundant now.
cp *.sh ~/.scripts/
