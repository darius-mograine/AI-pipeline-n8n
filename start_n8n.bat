@echo off
title Запуск n8n

echo Разрешаю модуль fs и доступ к папке с карточками...
set NODE_FUNCTION_ALLOW_BUILTIN=fs
set N8N_RESTRICT_FILE_ACCESS_TO=D:\n8n-card-pipeline

echo Запускаю n8n...
start "n8n server" cmd /k "set NODE_FUNCTION_ALLOW_BUILTIN=fs && set N8N_RESTRICT_FILE_ACCESS_TO=D:\n8n-card-pipeline && npx n8n"

echo Жду, пока n8n поднимется (12 секунд)...
timeout /t 12 /nobreak >nul

echo Открываю браузер...
start "" "http://localhost:5678"

echo Готово! n8n работает в отдельном окне, не закрывайте его.
