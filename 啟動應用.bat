@echo off
chcp 65001 >nul
echo.
echo ================================
echo    🌲 Orbit 時間管理應用
echo ================================
echo.
echo 正在啟動本地服務器...
echo.
echo 請選擇啟動方式：
echo.
echo [1] 使用 Python 啟動（推薦）
echo [2] 使用 Node.js 啟動
echo [3] 直接打開（不支持 PWA 功能）
echo [0] 退出
echo.
set /p choice=請輸入選項 (1/2/3/0): 

if "%choice%"=="1" goto python
if "%choice%"=="2" goto nodejs
if "%choice%"=="3" goto direct
if "%choice%"=="0" goto end
goto invalid

:python
echo.
echo 🐍 使用 Python 啟動服務器...
echo.
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 未找到 Python，請先安裝 Python
    echo 下載地址：https://www.python.org/downloads/
    pause
    goto end
)

echo ✅ Python 已安裝
echo.
echo 🚀 啟動服務器在 http://localhost:8080
echo.
echo 💡 提示：
echo    - 在瀏覽器中打開 http://localhost:8080
echo    - 點擊地址欄的安裝圖標即可安裝應用
echo    - 按 Ctrl+C 停止服務器
echo.
python -m http.server 8080
goto end

:nodejs
echo.
echo 📦 使用 Node.js 啟動服務器...
echo.
node --version >nul 2>&1
if errorlevel 1 (
    echo ❌ 未找到 Node.js，請先安裝 Node.js
    echo 下載地址：https://nodejs.org/
    pause
    goto end
)

echo ✅ Node.js 已安裝
echo.
echo 正在檢查 http-server...
call npx http-server --version >nul 2>&1
echo.
echo 🚀 啟動服務器在 http://localhost:8080
echo.
echo 💡 提示：
echo    - 在瀏覽器中打開 http://localhost:8080
echo    - 點擊地址欄的安裝圖標即可安裝應用
echo    - 按 Ctrl+C 停止服務器
echo.
npx http-server -p 8080 --yes
goto end

:direct
echo.
echo 📱 直接打開應用...
echo.
echo ⚠️  注意：此方式不支持 PWA 功能
echo    （無法安裝為應用、無法離線使用）
echo.
echo 💡 建議使用選項 1 或 2 啟動本地服務器
echo.
pause
start index.html
goto end

:invalid
echo.
echo ❌ 無效的選項，請重新運行腳本
pause
goto end

:end
echo.
echo 感謝使用 Orbit！
echo.

