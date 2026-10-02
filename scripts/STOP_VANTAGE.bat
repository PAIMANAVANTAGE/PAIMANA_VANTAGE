@echo off
taskkill /FI "WINDOWTITLE eq PAIMANA VANTAGE Backend*" /T /F >nul 2>&1
taskkill /FI "WINDOWTITLE eq PAIMANA VANTAGE Frontend*" /T /F >nul 2>&1
echo VANTAGE processes stopped.
