#/bin/sh

nohup socks5s 127.0.0.1:1080  &>/dev/null  & 

nohup kcptuns -t 127.0.0.1:1080 \
              -l :${KCP_PORT1:-1081} \
              -mode ${KCP_MODE:-fast2} \
              --key ${KCP_PASS:-$(hostname)} \
              &>/dev/null  & 

nohup kcptuns -t 127.0.0.1:1234 \
              -l :${KCP_PORT2:-8389} \
              -mode ${KCP_MODE:-fast2} \
              --crypt none \
              &>/dev/null  & 

nohup sss  -p ${SS_PORT:-8388} \
           -k ${SS_PASS:-$(hostname)} \
           -m ${SS_METHOD:-aes-256-cfb} \
           -t ${SS_TIMEOUT:-300} \
           &>/dev/null &

while true ; do sleep 1 ; done ;
