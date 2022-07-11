#!/bin/bash
isExistApp=pgrep docker
if [[ -n $isExistApp ]]; then
sudo service docker stop
fi