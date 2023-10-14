#!/bin/bash

# 更新包管理器
sudo apt update

# 安装 tftpd-hpa 软件包
sudo apt install tftp tftpd
sudo apt - install tftp-hpa tftpd-hpa

# 配置 TFTP 服务器
sudo cp /etc/default/tftpd-hpa /etc/default/tftpd-hpa_backup
echo 'TFTP_USERNAME="tftp"' | sudo tee -a /etc/default/tftpd-hpa
echo 'TFTP_DIRECTORY="~/tftproot"' | sudo tee -a /etc/default/tftpd-hpa
echo 'TFTP_ADDRESS="0.0.0.0:69"' | sudo tee -a /etc/default/tftpd-hpa
echo 'TFTP_OPTIONS="--secure --create"' | sudo tee -a /etc/default/tftpd-hpa

# 创建 TFTP 目录
mkdir -p ~/tftproot

# 修改目录权限
#sudo chown -R tftp:tftp ~/tftproot
sudo chmod -R 777 ~/tftproot

# 重启 TFTP 服务
sudo systemctl restart tftpd-hpa
echo "TFTP 服务器已成功安装和配置。"
