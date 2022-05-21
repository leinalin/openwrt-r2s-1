#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

#交换Lan Wan 接口
sed -i 's/wan\" \"eth0/wan\" \"eth1/g' target/linux/rockchip/armv8/base-files/etc/board.d/01_leds
sed -i 's/lan\" \"eth1/lan\" \"eth0/g' target/linux/rockchip/armv8/base-files/etc/board.d/01_leds
sed -i "s/eth1' 'eth0/eth0' 'eth1/g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network

#use vendor driver
sed -i 's/kmod-usb-net-rtl8152/kmod-usb-net-rtl8152-vendor/g' target/linux/rockchip/image/armv8.mk
