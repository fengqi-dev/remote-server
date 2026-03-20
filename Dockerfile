FROM debian:trixie AS builder
ARG DEBIAN_FRONTEND=noninteractive

ADD . /root/app
WORKDIR /root/app

RUN bash scripts/vscode.sh && bash scripts/cursor.sh

FROM debian:trixie
COPY --from=builder /root/vscode-server-full.tar.gz /root/dist/vscode-server-full.tar.gz 
COPY --from=builder /root/cursor-server-full.tar.gz /root/dist/cursor-server-full.tar.gz