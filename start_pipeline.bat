@echo off
echo ============================================
echo   Citi Bike ELT Pipeline starten
echo ============================================
echo.

cd /d "%~dp0"

echo [1/2] Starte Docker-Container...
docker-compose up -d
if %ERRORLEVEL% neq 0 (
    echo FEHLER: Docker-Container konnten nicht gestartet werden.
    pause
    exit /b 1
)

echo.
echo [2/2] Starte Pipeline...
python run_pipeline.py
if %ERRORLEVEL% neq 0 (
    echo FEHLER: Pipeline abgebrochen.
    pause
    exit /b 1
)

echo.
echo ============================================
echo   Pipeline erfolgreich abgeschlossen!
echo ============================================
pause
