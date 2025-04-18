#!/bin/bash

# 환경 변수 설정
export DJANGO_SETTINGS_MODULE=vacation.settings

# 데이터베이스 마이그레이션 실행
python manage.py migrate

# LangGraph 수동 초기화
python -c "from chatbot.graph_chatbot import initialize_graph; initialize_graph()"

# Daphne 웹 서버 실행
exec daphne vacation.asgi:application --port 8000 --bind 0.0.0.0 -v2 