#!/bin/bash

# 如果当前是linux系统
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # 1. 下载服务端
    wget https://github.com/fatedier/frp/releases/download/v0.47.0/frp_0.47.0_linux_amd64.tar.gz

    # 2. 解压
    tar -zxvf frp_0.47.0_linux_amd64.tar.gz
# 如果是mac系统
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # 1. 下载服务端
    wget https://github.com/fatedier/frp/releases/download/v0.47.0/frp_0.47.0_darwin_amd64.tar.gz

    # 2. 解压
    tar -zxvf frp_0.47.0_darwin_amd64.tar.gz


# 结束
else
    echo "不支持的系统"
    exit 1
fi

# 3. 获取参数1
config="[common]
server_addr = $1
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = $2
remote_port = $2
"
echo "$config" > frp_0.47.0_linux_amd64/frpc.ini

# 运行
./frp_0.47.0_linux_amd64/frpc -c ./frp_0.47.0_linux_amd64/frpc.ini