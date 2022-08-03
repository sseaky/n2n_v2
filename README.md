# n2n_v2

install n2n v2 edge

## Linux
```bash
sudo apt-get install autoconf automake libtool make
curl https://raw.githubusercontent.com/sseaky/n2n_v2/main/install.sh | sudo bash
sudo systemctl enable edge.service && sudo systemctl restart edge.service && sleep 2 && systemctl status edge.service && ip a
```

## windows
Win +R -> shell:startup
