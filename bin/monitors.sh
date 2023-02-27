#!/usr/bin/env bash

set -e

# 脚本路径
sc_dir="$(
  cd "$(dirname "$0")" >/dev/null 2>&1 || exit
  pwd -P
)"

# 去掉路径后缀
rs_path=${sc_dir/k6-typescript-framework*/k6-typescript-framework}

# 首先清除已编译文件
echo "首先清除已编译文件..."
mkdir -p bin/build && rm -rf bin/build/*

rm -rf logs/*/*.log

# 编译环境
ENV=${1:-"-"}

# 如果为基础系统
([ "$ENV" != "local" ] && [ "$ENV" != "dev" ] && [ "$ENV" != "test" ] && [ "$ENV" != "beta" ] && [ "$ENV" != "prod" ]) && echo "参数[1: $1]不合法!" && exit

#cd $rs_path

# 启动应用服务
echo "启动应用服务..."

yarn monitors

#http://brtc-opentest.baijiayun.com:3000
