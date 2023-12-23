#!/usr/bin/env sh

cd /etc/nginx/conf.d
envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < main.m-tips.local.template > main.m-tips.local.conf
envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < admin.m-tips.local.template > admin.m-tips.local.conf

#nginx -g "daemon off;"
nginx-debug -g "daemon off;"
