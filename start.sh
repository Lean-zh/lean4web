#!/bin/bash

# 配置参数
MAX_RETRIES=300          # 最大重试次数
DELAY_SECONDS=1        # 每次重试之间的延迟（秒）
COMMAND="PORT=18021 npm run production"  # 要执行的命令

# 日志函数
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1"
}

# 重试逻辑
retry_count=0
while [ $retry_count -le $MAX_RETRIES ]; do
    if [ $retry_count -gt 0 ]; then
        log "尝试第 $retry_count 次重试..."
    fi

    # 执行命令
    log "执行命令: $COMMAND"
    eval $COMMAND

    # 检查命令退出状态
    if [ $? -eq 0 ]; then
        log "命令执行成功"
        exit 0
    else
        log "命令执行失败"
        retry_count=$((retry_count+1))
        if [ $retry_count -le $MAX_RETRIES ]; then
            log "等待 $DELAY_SECONDS 秒后重试..."
            sleep $DELAY_SECONDS
        fi
    fi
done

log "达到最大重试次数 ($MAX_RETRIES)，放弃重试