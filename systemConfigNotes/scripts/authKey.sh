if [ "$2" == "root" ]; then
    cat ~/.ssh/id_rsa.pub | ssh $2@$1 'mkdir -p /root/.ssh; cat >> ~/.ssh/authorized_keys'
else
    cat ~/.ssh/id_rsa.pub | ssh $2@$1 'cat >> ~/.ssh/authorized_keys'
fi
