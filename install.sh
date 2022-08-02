#!/usr/bin/env bash
# @Author: Seaky
# @Date:   2022/07/21 15:37

mkdir -p ~/git && cd ~/git && git clone https://github.com/ntop/n2n.git -b 2.8-stable && cd n2n && ./autogen.sh && ./configure && make && sudo make install


CONFIGFILE="/etc/n2n/edge.conf"
[ ! -e $CONFIGFILE ] && sudo mkdir -p /etc/n2n && sudo bash -c "install -m 666 /dev/null $CONFIGFILE" && echo "- Make $CONFIGFILE" &&cat > $CONFIGFILE <<-EOF
-d=n2n0
-c=
-k=
-a=<ip>
-l=<server>:<port>
EOF


SERVICEFILE="/etc/systemd/system/edge.service"
[ ! -e $SERVICEFILE ] && sudo mkdir -p /etc/systemd/system && sudo bash -c "install -m 666 /dev/null $SERVICEFILE" && echo "- Make $SERVICEFILE" && cat > $SERVICEFILE <<-EOF
[Unit]
Description=n2n
After=network.target

[Service]
Type=simple
User=root
ExecStart=/usr/sbin/edge /etc/n2n/edge.conf -f

[Install]
WantedBy=multi-user.target
EOF

echo "systemctl enable edge.service && systemctl restart edge.service && sleep 2 && systemctl status edge.service && ip a"
