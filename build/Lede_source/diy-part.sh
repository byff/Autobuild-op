#!/bin/bash
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
# DIY扩展 在此脚本 增加插件

git clone https://github.com/kenzok8/openwrt-packages package/gd772
wget https://raw.githubusercontent.com/gd0772/patch/main/gd772.sh
bash gd772.sh
sed -i 's/02b79d5e2b07b5e64cd28f1fe84395ee11eef95fc49fd923a9ab93022b148be6/skip/g' feeds/packages/utils/containerd/Makefile

git clone https://github.com/kenzok8/openwrt-packages package/byff

curl -fsSL https://raw.githubusercontent.com/byff/AutoBuild-op/main/build/Lede_source/diy/x86_index.htm > ./package/lean/autocore/files/x86/index.htm
sed -i "s/2022.02.01/$(TZ=UTC-8 date "+%Y.%m.%d")/g" package/lean/autocore/files/x86/index.htm
./scripts/feeds update -a
./scripts/feeds install -a
