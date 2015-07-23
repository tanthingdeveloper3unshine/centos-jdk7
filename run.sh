if [ -f /.root_pw ]; then
        echo "Root password has already been set!"
        exit 0
fi

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
echo "root:$PASS" | chpasswd
touch /.root_pw

echo "The service is running.You can connect to it using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo ""
if [ ! ${ROOT_PASS} ];then
echo "The default root password is '$PASS'"
echo ""
echo "Please change it as soon as possible!"
fi
exec /usr/sbin/sshd -D