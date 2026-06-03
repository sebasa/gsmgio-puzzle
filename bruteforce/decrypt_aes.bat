@echo off
setlocal enabledelayedexpansion

REM ================================================
REM  GSMG.IO Puzzle - AES-256-CBC Bruteforce
REM ================================================
REM  1. Pon el texto cifrado en secret.txt
REM  2. Pon las claves (una por linea) en claves.txt
REM  3. Resultados exitosos se guardan en resultados\
REM  4. Requiere OpenSSL en el PATH
REM     https://slproweb.com/products/Win32OpenSSL.html
REM ================================================

set CIPHER_FILE=secret1.txt
set KEYS_FILE=wordlist.txt
set OUTPUT_DIR=resultados
set OPENSSL=openssl
set MODE=SHA256

REM Opcion para probar tambien la palabra al reves (1 = Si, 0 = No)
set TEST_REVERSE=1

REM Configurar desde que linea comenzar (0 = desde el principio)
set START_OFFSET=0

REM Cambia a RAW para usar claves sin hashear
REM set MODE=RAW

echo.
echo  ============================================
echo   GSMG.IO Puzzle - AES Bruteforce
echo   Archivo cifrado : %CIPHER_FILE%
echo   Lista de claves : %KEYS_FILE%
echo   Modo            : %MODE%
echo   Probar reversa  : %TEST_REVERSE%
echo   Offset inicial  : %START_OFFSET%
echo  ============================================
echo.

if not exist "%CIPHER_FILE%" (
    echo [ERROR] No se encontro: %CIPHER_FILE%
    pause & exit /b 1
)
if not exist "%KEYS_FILE%" (
    echo [ERROR] No se encontro: %KEYS_FILE%
    pause & exit /b 1
)

if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

set COUNT=0
set SUCCESS=0
set LINE_COUNT=0

if %START_OFFSET% GTR 0 (
    echo [INFO] Saltando las primeras %START_OFFSET% claves...
)

for /f "usebackq tokens=*" %%K in ("%KEYS_FILE%") do (
    set /a LINE_COUNT+=1
    if !LINE_COUNT! GTR %START_OFFSET% (
        call :TRY "%%K"
        if /i "%TEST_REVERSE%"=="1" (
            call :REVERSE "%%K"
            call :TRY "!REVERSED_STR!"
        )
    )
)

echo.
echo  ============================================
echo   Claves probadas : %COUNT%
echo   Exitos          : %SUCCESS%
echo  ============================================
if %SUCCESS% GTR 0 (
    echo   Resultados en carpeta: %OUTPUT_DIR%\
) else (
    echo   Sin exitos. Agrega mas claves o prueba MODE=RAW
)
echo.
pause
goto :EOF

REM ---- Subrutina por cada clave ----
:TRY
set /a COUNT+=1
set RAW_KEY=%~1

if "%RAW_KEY%"=="" goto :EOF

if /i "%MODE%"=="SHA256" (
    <nul set /p dummy="%RAW_KEY%"> _tmpkey.txt
    for /f "tokens=2 delims= " %%H in ('"%OPENSSL%" dgst -sha256 _tmpkey.txt') do set PASS=%%H
    del _tmpkey.txt >nul 2>&1
) else (
    set PASS=%RAW_KEY%
)

"%OPENSSL%" enc -aes-256-cbc -d -a -in "%CIPHER_FILE%" -out "%OUTPUT_DIR%\out_%COUNT%.txt" -pass pass:%PASS% 2>nul

if %errorlevel%==0 (
    echo.
    echo [EXITO] Clave #%COUNT%: %RAW_KEY%
    echo         Hash: %PASS%
    echo         Archivo: %OUTPUT_DIR%\out_%COUNT%.txt
    echo.
    echo --- Contenido ---
    type "%OUTPUT_DIR%\out_%COUNT%.txt"
    echo.
    echo -----------------
    set /a SUCCESS+=1
) else (
    echo [FALLO] #%COUNT% : %RAW_KEY%
    if exist "%OUTPUT_DIR%\out_%COUNT%.txt" del "%OUTPUT_DIR%\out_%COUNT%.txt"
)
goto :EOF

REM ---- Subrutina para invertir cadena ----
:REVERSE
set "str=%~1"
set "rev="
:rev_loop
if defined str (
    set "rev=!rev!!str:~-1!"
    set "str=!str:~0,-1!"
    goto rev_loop
)
set "REVERSED_STR=!rev!"
goto :EOF