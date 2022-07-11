#!/bin/bash
isExistApp=pgrep docker
if [[ -n $isExistApp ]]; then
systemctl stop docker.service
systemctl stop docker.socket
fi