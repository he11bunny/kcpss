# kcpss 
kcptun with shadowsocks 

docker启动命令参考：

docker run --rm  -e SS_PASS=your_ss_pass -e KCP_PASS=your_kcp_pass -p your_ss_port:8388 -p your_kcp_socks_port:1081/udp -p your_kcp_ss_port:8389/udp  wuqz/kcpss

端口列表：
8388/TCP  shoadowsocks-go的原生端口
1081/UDP  kcp端口，后端是socks5代理，kcp协议是加密的
8389/UDP  kcp端口，后端是shadowsocks，kcp协议是明文的