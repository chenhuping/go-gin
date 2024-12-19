FROM alpine:3.6

LABEL maintainer="Hydeli <hai_li@iot-dreamcatcher.com>"
# 切换软件源
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    apk clean

COPY out/app /home/app

EXPOSE 8080
ENTRYPOINT ["./home/app"]
