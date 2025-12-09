# 🌲 Orbit PWA 完整部署指南

## 📋 目錄
1. [什麼是 PWA](#什麼是-pwa)
2. [準備工作](#準備工作)
3. [生成應用圖標](#生成應用圖標)
4. [本地測試](#本地測試)
5. [部署到線上](#部署到線上)
6. [安裝應用](#安裝應用)
7. [故障排除](#故障排除)

---

## 🎯 什麼是 PWA

**Progressive Web App (漸進式網頁應用)** 是一種可以像原生應用一樣安裝和使用的網頁應用。

### ✨ PWA 的優勢：

✅ **跨平台** - 一次開發，在 iOS、Android、Windows、Mac 都能使用  
✅ **可安裝** - 添加到主屏幕，像原生應用一樣啟動  
✅ **離線使用** - 即使沒有網絡也能運行  
✅ **自動更新** - 無需通過應用商店審核  
✅ **輕量級** - 不佔用太多存儲空間  
✅ **無需下載** - 用戶可以直接從網頁安裝  

---

## 🛠️ 準備工作

### 已完成的文件：

```
Orbit_Final/
├── index.html              # 主應用文件（已更新 PWA 配置）
├── manifest.json           # PWA 配置文件 ✨
├── service-worker.js       # 服務工作者（離線功能）✨
├── generate-icons.html     # 圖標生成器 ✨
├── icons/                  # 圖標文件夾
│   ├── icon-72x72.png      # 需要生成
│   ├── icon-96x96.png      # 需要生成
│   ├── icon-128x128.png    # 需要生成
│   ├── icon-144x144.png    # 需要生成
│   ├── icon-152x152.png    # 需要生成
│   ├── icon-192x192.png    # 需要生成
│   ├── icon-384x384.png    # 需要生成
│   └── icon-512x512.png    # 需要生成
└── PWA_部署指南.md         # 本文件
```

---

## 🎨 生成應用圖標

### 方法一：使用圖標生成器（推薦）

1. **打開圖標生成器**
   ```bash
   # 在瀏覽器中打開
   start generate-icons.html
   ```

2. **生成圖標**
   - 頁面會自動生成所有尺寸的圖標
   - 點擊「下載所有圖標」按鈕
   - 將下載的圖標文件放入 `icons/` 文件夾

3. **驗證圖標**
   - 確認 `icons/` 文件夾中有 8 個 PNG 圖標文件
   - 文件名格式：`icon-72x72.png` 到 `icon-512x512.png`

### 方法二：使用在線工具

1. 訪問 [PWA Icon Generator](https://www.pwabuilder.com/)
2. 上傳一個 512x512 的圖標
3. 下載生成的圖標包
4. 將圖標放入 `icons/` 文件夾

### 方法三：使用自己的圖標

- 準備一個至少 512x512 的 PNG 圖標
- 使用 Photoshop、GIMP 或在線工具調整尺寸
- 生成所需的 8 個尺寸

---

## 🧪 本地測試

### 步驟 1：啟動本地服務器

PWA 需要 HTTPS 或 localhost 環境才能運行。

#### 使用 Python（推薦）

```bash
# Python 3
python -m http.server 8080

# Python 2
python -m SimpleHTTPServer 8080
```

#### 使用 Node.js

```bash
# 安裝 http-server
npm install -g http-server

# 啟動服務器
http-server -p 8080
```

#### 使用 VS Code 擴展

- 安裝 "Live Server" 擴展
- 右鍵點擊 `index.html`
- 選擇 "Open with Live Server"

### 步驟 2：在瀏覽器中測試

1. **打開應用**
   ```
   http://localhost:8080
   ```

2. **檢查 Service Worker**
   - 打開瀏覽器開發者工具（F12）
   - 前往 "Application" 或 "應用程序" 標籤
   - 查看 "Service Workers" 部分
   - 應該看到 service-worker.js 已激活

3. **檢查 Manifest**
   - 在同一個 "Application" 標籤
   - 查看 "Manifest" 部分
   - 確認應用名稱、圖標等信息正確

4. **測試安裝提示**
   - 在 Chrome 地址欄右側應該會出現安裝圖標 ➕
   - 或者右下角會出現「安裝應用」按鈕

### 步驟 3：測試離線功能

1. 在線訪問應用一次（讓 Service Worker 緩存資源）
2. 打開開發者工具，切換到 "Network" 標籤
3. 勾選 "Offline" 選項
4. 刷新頁面，應該仍然可以正常使用

---

## 🌐 部署到線上

要讓其他人也能安裝您的應用，需要將其部署到線上服務器。

### 方案一：GitHub Pages（免費，推薦）

1. **創建 GitHub 倉庫**
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Orbit PWA"
   git branch -M main
   git remote add origin https://github.com/你的用戶名/orbit-app.git
   git push -u origin main
   ```

2. **啟用 GitHub Pages**
   - 前往倉庫的 Settings → Pages
   - Source 選擇 "main" 分支
   - 點擊 Save
   - 等待幾分鐘後訪問：`https://你的用戶名.github.io/orbit-app/`

3. **更新 manifest.json**
   ```json
   {
     "start_url": "https://你的用戶名.github.io/orbit-app/index.html",
     "scope": "https://你的用戶名.github.io/orbit-app/"
   }
   ```

### 方案二：Netlify（免費）

1. 訪問 [Netlify](https://www.netlify.com/)
2. 拖放整個項目文件夾到 Netlify
3. 獲得類似 `https://你的項目名.netlify.app` 的網址

### 方案三：Vercel（免費）

1. 訪問 [Vercel](https://vercel.com/)
2. 導入 GitHub 倉庫或直接上傳文件
3. 獲得 `https://你的項目名.vercel.app` 網址

### 方案四：自己的服務器

1. 將所有文件上傳到服務器
2. 確保服務器支持 HTTPS（PWA 必需）
3. 配置正確的 MIME 類型：
   ```
   .json → application/manifest+json
   .js → application/javascript
   ```

---

## 📱 安裝應用

### Android (Chrome)

1. 訪問您的應用網址
2. 點擊瀏覽器菜單（⋮）
3. 選擇「添加到主屏幕」或「安裝應用」
4. 確認安裝
5. 應用圖標會出現在主屏幕上

### iOS (Safari)

1. 在 Safari 中打開應用網址
2. 點擊底部的「分享」按鈕 (📤)
3. 向下滾動，選擇「加入主畫面」
4. 編輯名稱（如需要）
5. 點擊「新增」
6. 應用圖標會出現在主屏幕上

**注意**：iOS 的 PWA 功能有限制：
- 不支持推送通知
- 不支持背景同步
- Service Worker 功能受限

### Windows (Edge/Chrome)

1. 訪問應用網址
2. 點擊地址欄右側的安裝圖標 ➕
3. 點擊「安裝」
4. 應用會添加到開始菜單和桌面

### Mac (Chrome/Safari)

1. 訪問應用網址
2. 在 Chrome：點擊地址欄的安裝圖標
3. 在 Safari：檔案 → 加入 Dock
4. 應用會添加到 Dock 和應用程序文件夾

---

## 🐛 故障排除

### 問題 1：Service Worker 未註冊

**症狀**：控制台顯示 Service Worker 錯誤

**解決方案**：
```javascript
// 檢查文件路徑是否正確
// service-worker.js 必須在項目根目錄
// 確保使用 HTTPS 或 localhost
```

### 問題 2：圖標不顯示

**症狀**：安裝後應用圖標是默認圖標

**解決方案**：
1. 確認 `icons/` 文件夾中有所有圖標
2. 檢查 `manifest.json` 中的圖標路徑
3. 清除瀏覽器緩存並重新安裝
4. 確保圖標是 PNG 格式

### 問題 3：無法安裝

**症狀**：沒有看到安裝提示

**解決方案**：
1. 確保使用 HTTPS（或 localhost）
2. 檢查 `manifest.json` 是否正確
3. 確保有 Service Worker
4. 查看控制台是否有錯誤信息
5. 某些瀏覽器需要用戶與頁面互動後才顯示安裝提示

### 問題 4：離線不工作

**症狀**：斷網後無法使用應用

**解決方案**：
1. 確認 Service Worker 已激活
2. 檢查緩存策略是否正確
3. 在線訪問一次，讓 Service Worker 緩存資源
4. 清除緩存並重新訪問

### 問題 5：iOS 無法安裝

**症狀**：iOS 上找不到「加入主畫面」選項

**解決方案**：
1. 必須使用 Safari 瀏覽器
2. 其他瀏覽器（Chrome、Firefox）在 iOS 上不支持 PWA
3. 確保已添加 Apple 特定的 meta 標籤（已在 HTML 中）

---

## 🎉 成功檢查清單

安裝完成後，確認以下功能：

- [ ] 應用圖標正確顯示
- [ ] 點擊圖標可以啟動應用
- [ ] 全屏顯示（無地址欄）
- [ ] 離線可以使用
- [ ] 數據保存正常（localStorage）
- [ ] Toast 提示正常顯示
- [ ] 所有功能正常工作

---

## 📊 進階配置

### 自定義啟動畫面

在 `manifest.json` 中添加：
```json
{
  "background_color": "#FFF8DC",
  "theme_color": "#8B4513"
}
```

### 推送通知（需要後端支持）

```javascript
// 請求通知權限
Notification.requestPermission().then(permission => {
  if (permission === 'granted') {
    // 訂閱推送服務
  }
});
```

### 分享功能

```javascript
if (navigator.share) {
  navigator.share({
    title: 'Orbit 時間管理',
    text: '一起使用 Orbit 管理時間！',
    url: window.location.href
  });
}
```

---

## 📚 更多資源

- [MDN - PWA 指南](https://developer.mozilla.org/zh-CN/docs/Web/Progressive_web_apps)
- [Google PWA 教程](https://web.dev/progressive-web-apps/)
- [PWA Builder](https://www.pwabuilder.com/)
- [Lighthouse 測試工具](https://developers.google.com/web/tools/lighthouse)

---

## 💡 提示

1. **定期更新**：修改代碼後，更新 `service-worker.js` 中的版本號
2. **測試多平台**：在不同設備和瀏覽器上測試
3. **監控性能**：使用 Lighthouse 分析應用性能
4. **用戶反饋**：收集用戶反饋，持續改進

---

## 🎯 下一步

您的 Orbit 應用現在已經是一個完整的 PWA！

可以考慮的增強功能：
- 🔔 添加推送通知（需要後端）
- ☁️ 實現真實的雲端同步（需要後端）
- 📊 添加數據分析
- 🌍 支持多語言
- 🎨 更多主題選項
- 🔐 用戶賬號系統

---

**祝您的應用發布成功！** 🎉

如有問題，請查看控制台錯誤信息或參考上述故障排除部分。

