#!/bin/bash
systemctl start docker.service
docker-compose up -d --build