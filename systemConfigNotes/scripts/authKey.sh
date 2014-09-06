cat ~/.ssh/id_rsa.pub | ssh $2@$1 'cat >> ~/.ssh/authorized_keys'
