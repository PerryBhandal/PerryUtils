rm -rf ~/.scripts

mkdir -p ~/.scripts

pushd ~/.scripts > /dev/null

wget https://raw.githubusercontent.com/PerryBhandal/WindowSnapper/master/windowSnapper.rb

chmod +x windowSnapper.rb

popd > /dev/null

cp snapWindow.sh ~/.scripts
cp authKey.sh ~/.scripts
