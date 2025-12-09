@echo off
chcp 65001 >nul
cls
echo.
echo ================================
echo    🌲 Orbit PWA 快速測試
echo ================================
echo.
echo 正在檢查環境...
echo.

:: 檢查 Python
echo [檢查 Python]
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python 未安裝
) else (
    python --version
    echo ✅ Python 可用
)
echo.

:: 檢查 Node.js
echo [檢查 Node.js]
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js 未安裝
) else (
    node --version
    echo ✅ Node.js 可用
)
echo.

:: 檢查必要文件
echo [檢查應用文件]
if exist "index.html" (
    echo ✅ index.html
) else (
    echo ❌ index.html 缺失
)

if exist "manifest.json" (
    echo ✅ manifest.json
) else (
    echo ❌ manifest.json 缺失
)

if exist "service-worker.js" (
    echo ✅ service-worker.js
) else (
    echo ❌ service-worker.js 缺失
)

if exist "icons\" (
    echo ✅ icons 文件夾
    dir /b icons\*.png 2>nul | find /c ".png" >nul
    if errorlevel 1 (
        echo ⚠️  警告：icons 文件夾為空
        echo    請運行 generate-icons.html 生成圖標
    )
) else (
    echo ❌ icons 文件夾缺失
)

echo.
echo ================================
echo.
echo 選擇操作：
echo.
echo [1] 生成應用圖標
echo [2] 啟動應用（Python）
echo [3] 啟動應用（Node.js）
echo [4] 直接打開應用
echo [5] 查看完整說明
echo [0] 退出
echo.
set /p choice=請輸入選項: 

if "%choice%"=="1" (
    echo.
    echo 🎨 打開圖標生成器...
    start generate-icons.html
    echo.
    echo 💡 提示：
    echo    1. 在打開的頁面中點擊「下載所有圖標」
    echo    2. 將下載的圖標文件放入 icons\ 文件夾
    echo    3. 確保文件名正確（icon-72x72.png 等）
    echo.
    pause
)

if "%choice%"=="2" (
    call 啟動應用.bat
)

if "%choice%"=="3" (
    call 啟動應用.bat
)

if "%choice%"=="4" (
    start index.html
)

if "%choice%"=="5" (
    start PWA_部署指南.md
)

echo.
pause

