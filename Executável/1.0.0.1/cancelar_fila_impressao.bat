@echo off
echo Cancelando toda a fila de impressão...

:: Garantir que o script seja executado com privilégios elevados (admin)
:: Se não for administrado, solicita a elevação
:: O código abaixo reinicia o script com privilégios de administrador, caso necessário
:: O /B permite que o script continue sem abrir uma nova janela do prompt de comando

:: Verificar se o script foi iniciado com privilégios elevados
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    echo Este script precisa ser executado como Administrador.
    echo.
    echo Reiniciando o script com privilégios elevados...
    powershell -Command "Start-Process cmd -ArgumentList '/c, %~s0' -Verb runAs"
    exit /B
)

:: Parar o serviço de spooler de impressão
net stop spooler >nul 2>&1

:: Limpar a fila de impressão
del /F /Q %systemroot%\System32\spool\PRINTERS\* >nul 2>&1

:: Reiniciar o serviço de spooler de impressão
net start spooler >nul 2>&1

echo Fila de impressão cancelada e serviço reiniciado com sucesso.
exit /B
