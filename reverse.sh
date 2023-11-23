#!/bin/bash

# 외부 NAS 주소와 사용자 이름 설정
USER="USER"
HOST="HOST"
PORT=PORT
LOGFILE="/home/gpuadmin/2023811010/log/logfile.log"

# 로그 파일에 메시지 기록
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a $LOGFILE
}

# 무한 루프로 상태 확인 및 재연결
while true; do
    # 현재 SSH 터널 프로세스 확인
    if pgrep -f "ssh -fN -R $PORT:localhost:22" > /dev/null
    then
        log_message "터널 연결 상태: 정상"
    else
        log_message "터널 연결 상태: 끊어짐, 재연결 시도"
        # SSH 터널 재연결 
        # ssh -fN -R $PORT:localhost:22 $USER@$HOST
    fi
    # 30분 대기
    sleep 1800
done


# ps aux | grep reverse.sh
# ssh -fN -R xxxx:localhost:22 -o ServerAliveInterval=60 -o ServerAliveCountMax=10 USER@$HOST
