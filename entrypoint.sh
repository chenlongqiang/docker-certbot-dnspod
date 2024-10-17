#!/bin/bash

# 检查是否传入了 renew 参数
if [ "$1" = "renew" ]; then
  # 如果传入了 renew 参数，则移除该参数并执行续期操作
  shift
  certbot renew "$@"
else
  # 如果没有传入 renew 参数，则执行申请新证书操作
  certbot certonly \
    --authenticator certbot-dnspod \
    --certbot-dnspod-credentials /data/certbot/dnspod.ini \
    "$@"
fi