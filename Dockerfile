FROM alpine:latest

MAINTAINER wuqz <wuqinzhong$gmail.com>

ENV KCP_VER 20170329
ENV SS_VER  1.2.1

COPY enterpoint.sh /usr/bin/enterpoint.sh

RUN cd  ;\
    apk update  ;\ 
    apk add wget  ;\
    wget --no-check-certificate https://github.com/clangcn/kcp-server/raw/master/socks5_latest/socks5_linux_amd64  ;\
    mv socks5_linux_amd64 /usr/bin/socks5s  ;\
    wget  --no-check-certificate  https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz  ;\
    tar xzvf kcptun-linux-amd64*.tar.gz  ;\
    mv server_linux_amd64 /usr/bin/kcptuns  ;\
    wget  --no-check-certificate https://github.com/shadowsocks/shadowsocks-go/releases/download/$SS_VER/shadowsocks-server.zip  ;\
    unzip shadowsocks-server.zip  ;\
    rm -rf *.zip *.gz client_linux_amd64   ;\
    mv shadowsocks-server  /usr/bin/sss  ;\
    chmod a+x /usr/bin/*

CMD /usr/bin/enterpoint.sh
