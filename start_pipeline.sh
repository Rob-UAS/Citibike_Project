#!/bin/bash
echo "============================================"
echo "  Citi Bike ELT Pipeline starten"
echo "============================================"
echo

cd "$(dirname "$0")"

echo "[1/2] Starte Docker-Container..."
docker-compose up -d
if [ $? -ne 0 ]; then
    echo "FEHLER: Docker-Container konnten nicht gestartet werden."
    exit 1
fi

echo
echo "[2/2] Starte Pipeline..."
python3 run_pipeline.py
if [ $? -ne 0 ]; then
    echo "FEHLER: Pipeline abgebrochen."
    exit 1
fi

echo
echo "============================================"
echo "  Pipeline erfolgreich abgeschlossen!"
echo "============================================"
