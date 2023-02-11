#!/bin/zsh

# 1. 下载服务端
wget https://github.com/fatedier/frp/releases/download/v0.47.0/frp_0.47.0_linux_amd64.tar.gz

# 2. 解压
tar -zxvf frp_0.47.0_linux_amd64.tar.gz

# 修改权限
chmod 777 ./frp_0.47.0_linux_amd64/frps

# 3.运行
./frp_0.47.0_linux_amd64/frps -c ./frp_0.47.0_linux_amd64/frps.ini