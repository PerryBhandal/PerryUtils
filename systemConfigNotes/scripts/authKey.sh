cat ~/.ssh/id_rsa.pub | ssh $2@$1 'mkdir -p ~/.ssh; cat >> ~/.ssh/authorized_keys'
