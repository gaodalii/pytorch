#!/bin/bash
set -e

# 启动 SSH 服务 (以后台守护进程模式)
/usr/sbin/sshd -p 30122

# 启动 JupyterLab
jupyter lab --no-browser --ip=0.0.0.0 --port=30199 --allow-root --ServerApp.token=pytorch --notebook-dir=/data

# 保持容器运行，如果上面两个命令都是前台进程，可以不用这个 sleep 无限循环
wait -n

# 如果任一命令失败，退出脚本
exit $?