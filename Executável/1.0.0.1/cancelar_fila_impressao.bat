@echo off
:: Verifica se está sendo executado como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Solicitando privilegios de administrador...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Cancelando toda a fila de impressao...

:: Para o serviço de spooler de impressão
net stop spooler

:: Limpa a fila de impressão
del /F /Q %systemroot%\System32\spool\PRINTERS\*

:: Reinicia o serviço de spooler
net start spooler

echo Fila de impressao cancelada e servico reiniciado com sucesso.
