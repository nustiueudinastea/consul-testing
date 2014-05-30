GWIP=`/sbin/ip route | awk '/default/ { print $3 }'`

echo "Registering GIT service with consul"
curl -X PUT -d "{\"ID\": \"git1\", \"Name\":\"git\", \"Port\":22}" http://$GWIP:8500/v1/agent/service/register


# Updating the puppet modules repo
echo "Refreshing the puppet-modules repo"
git --git-dir=/home/git/puppet-modules.git fetch
echo "Starting sshd..."
/usr/sbin/sshd -D -f /etc/ssh/sshd_config
