@echo off
:: Verifica se está sendo executado como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando privilégios de administrador...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Cancelando toda a fila de impressão...

:: Para o serviço de spooler de impressão
net stop spooler

:: Limpa a fila de impressão
del /F /Q %systemroot%\System32\spool\PRINTERS\*

:: Reinicia o serviço de spooler
net start spooler

echo Fila de impressão cancelada e serviço reiniciado com sucesso.
