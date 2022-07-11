#!/bin/bash
isExistApp=pgrep docker
if [[ -n $isExistApp ]]; then
systemctl stop docker.service
fi