@echo off
chcp 65001 >nul
title Zapusk n8n
cd /d "%~dp0"

for /f "delims=" %%i in ('npm root -g') do set GLOBAL_NPM_PATH=%%i

echo Razreshayu moduli, dostup k papke, NODE_PATH=%GLOBAL_NPM_PATH%...
set NODE_FUNCTION_ALLOW_BUILTIN=fs
set NODE_FUNCTION_ALLOW_EXTERNAL=sharp
set N8N_RESTRICT_FILE_ACCESS_TO=D:\n8n-card-pipeline
set NODE_PATH=%GLOBAL_NPM_PATH%

echo Zapuskayu n8n v PowerShell...
start "n8n server" powershell -NoExit -Command "$env:NODE_FUNCTION_ALLOW_BUILTIN='fs'; $env:NODE_FUNCTION_ALLOW_EXTERNAL='sharp'; $env:N8N_RESTRICT_FILE_ACCESS_TO='D:\n8n-card-pipeline'; $env:NODE_PATH='%GLOBAL_NPM_PATH%'; npx n8n"

echo Zhdu, poka n8n podnimetsya (20 sekund)...
timeout /t 20 /nobreak >nul

echo Otkryvayu brauzer...
start "" "http://localhost:5678"

echo Gotovo! Esli brauzer otkrylsya na pustoy stranitse - podozhdite i obnovite (F5).
pause
