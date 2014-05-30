GWIP=`/sbin/ip route | awk '/default/ { print $3 }'`
puppet agent --onetime --verbose --ignorecache --no-daemonize --no-splay --show_diff --no-usecacheonfailure
