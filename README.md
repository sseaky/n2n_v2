# n2n_v2

install n2n v2 edge

## Linux
```bash
curl https://raw.githubusercontent.com/sseaky/n2n_v2/main/install.sh | bash

systemctl enable edge.service && systemctl restart edge.service && sleep 2 && systemctl status edge.service && ip a
```

## windows
Win +R -> shell:startup
