#!/bin/sh
docker pull selenoid/vnc:chrome_107.0 && docker pull selenoid/firefox && docker pull selenoid/opera && docker pull selenoid/video-recorder:latest-release && docker compose up --build