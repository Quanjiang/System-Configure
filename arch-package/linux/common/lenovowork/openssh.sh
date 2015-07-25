#
# SSH open
#
echo $0+"user,IP,Port"
RemoteUser=$1
RemoteIP=$2
RemotePort=$3

if [ ! -e ~/.ssh/id_rsa.pub ];then
    echo "Create SSH key"
    ssh-keygen -t rsa
fi
ssh $RemoteUser@$RemoteIP -p $RemotePort 'touch ~/.ssh/authorized_keys;chmod 600 ~/.ssh/authorized_keys'
scp ~/.ssh/id_rsa.pub $RemoteUser@$RemoteIP:~/.ssh/idrsapub1
ssh $RemoteUser@$RemoteIP -p $RemotePort 'cat ~/.ssh/idrsapub1 >>  ~/.ssh/authorized_keys'
ssh $RemoteUser@$RemoteIP -p $RemotePort 'rm -rf ~/.ssh/idrsapub1'
#
#
#
