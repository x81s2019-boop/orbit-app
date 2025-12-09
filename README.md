# 🌲 Orbit 時間管理應用

<div align="center">

![Orbit Logo](https://img.shields.io/badge/Orbit-時間管理-8B4513?style=for-the-badge)
![PWA](https://img.shields.io/badge/PWA-Ready-4CAF50?style=for-the-badge)
![Version](https://img.shields.io/badge/版本-1.0.0-blue?style=for-the-badge)

**智能時間管理應用 - 任務、習慣、目標追蹤工具**

[立即使用](#快速開始) • [查看功能](#功能特色) • [安裝指南](#安裝應用) • [部署說明](PWA_部署指南.md)

</div>

---

## ✨ 功能特色

### 📝 任務管理
- ✅ 快速創建和追蹤日常任務
- 🎯 多優先級任務分類（高/中/低）
- ⏰ 時間安排和提醒
- 📊 任務完成狀態追蹤

### 🌱 習慣養成
- 📅 每日習慣打卡
- 🔥 連續天數記錄
- 📈 視覺化進度追蹤
- 🎖️ 成就徽章系統

### 🎯 年度目標
- 🎪 長期目標設定
- 📊 進度百分比顯示
- 🏆 多維度分類管理
- ✨ 目標達成慶祝

### 🍅 番茄鐘
- ⏱️ 25分鐘專注時段
- ☕ 自動休息提醒
- 📝 專注記錄統計
- 🎵 專注音效（可選）

### 📊 數據統計
- 📈 任務完成率分析
- 🌟 習慣養成趨勢
- ⏰ 時間使用報告
- 📅 週/月/年度總結

### 💾 數據管理
- ☁️ 雲端同步（即將推出）
- 📦 本地備份與還原
- 📤 數據導出（JSON/CSV）
- 🔄 自動保存（每30秒）

---

## 🚀 快速開始

### 方法一：直接使用（最簡單）

1. **用瀏覽器打開**
   ```bash
   # 雙擊打開
   index.html
   ```

2. **開始使用**
   - 應用會自動加載默認數據
   - 所有數據保存在瀏覽器本地
   - 無需註冊或登錄

### 方法二：本地服務器（推薦，啟用 PWA）

1. **啟動服務器**
   ```bash
   # 使用 Python
   python -m http.server 8080
   
   # 或使用 Node.js
   npx http-server -p 8080
   ```

2. **訪問應用**
   ```
   http://localhost:8080
   ```

3. **安裝為應用**
   - 點擊瀏覽器地址欄的安裝圖標
   - 或點擊右下角的「安裝應用」按鈕

### 方法三：線上部署

查看完整的[部署指南](PWA_部署指南.md)

---

## 📱 安裝應用

### 將 Orbit 安裝到設備

Orbit 是一個 PWA（漸進式網頁應用），可以像原生應用一樣安裝：

#### 📱 Android
1. 在 Chrome 中打開應用
2. 點擊菜單 → 「添加到主屏幕」
3. 確認安裝

#### 🍎 iOS
1. 在 Safari 中打開應用
2. 點擊分享按鈕 📤
3. 選擇「加入主畫面」

#### 💻 Windows/Mac
1. 在 Chrome/Edge 中打開應用
2. 點擊地址欄的安裝圖標 ➕
3. 確認安裝

安裝後的優勢：
- ✅ 獨立應用圖標
- ✅ 全屏顯示
- ✅ 離線使用
- ✅ 更快啟動

---

## 🎨 界面預覽

### 主要頁面

```
🏠 首頁儀表板
├── 📊 統計卡片（今日任務、已完成、週目標、連續打卡）
├── ✅ 今日待辦清單
├── 🌱 習慣打卡
└── 🎯 年度目標進度

✅ 待辦頁面
├── 📝 任務列表
├── ➕ 新增任務
├── 🗑️ 刪除任務
└── ✏️ 編輯任務

📅 日曆頁面
├── 📆 月曆視圖
├── 📋 每日任務
└── 🔄 月份切換

🍅 專注頁面
├── ⏱️ 番茄鐘計時器
├── 📝 專注記錄
└── 🎯 目標管理

📊 統計頁面
├── 📈 完成趨勢
├── 🌟 習慣分析
└── 📅 年度總結

⚙️ 設定頁面
├── 👤 個人資料
├── 🎨 主題設定
├── 🔔 通知設定
├── 💾 數據管理
└── ℹ️ 關於應用
```

---

## 🛠️ 技術架構

- **前端框架**：原生 JavaScript（無依賴）
- **UI 設計**：木質溫暖調風格
- **數據存儲**：localStorage
- **離線支持**：Service Worker
- **圖標字體**：Font Awesome 6.4.0
- **字體**：Noto Sans TC

### 文件結構

```
Orbit_Final/
├── index.html              # 主應用文件
├── manifest.json           # PWA 配置
├── service-worker.js       # 服務工作者
├── generate-icons.html     # 圖標生成器
├── icons/                  # 應用圖標
│   ├── icon-72x72.png
│   ├── icon-96x96.png
│   ├── icon-128x128.png
│   ├── icon-144x144.png
│   ├── icon-152x152.png
│   ├── icon-192x192.png
│   ├── icon-384x384.png
│   └── icon-512x512.png
├── README.md               # 本文件
└── PWA_部署指南.md         # 詳細部署說明
```

---

## 📝 使用說明

### 新增任務
1. 點擊右下角的 ➕ 按鈕
2. 輸入任務名稱和時間
3. 選擇優先級
4. 點擊確定

### 習慣打卡
1. 在首頁找到習慣卡片
2. 點擊習慣項目打卡
3. 查看連續天數記錄

### 設定目標
1. 前往專注頁面
2. 點擊「新增目標」
3. 輸入目標信息和進度
4. 定期更新進度

### 使用番茄鐘
1. 前往專注頁面
2. 點擊「開始專注」
3. 專注 25 分鐘
4. 休息 5 分鐘

### 查看統計
1. 點擊底部「統計」標籤
2. 查看各項數據
3. 分析時間使用情況

---

## 🔧 自定義配置

### 修改番茄鐘時間

在 `index.html` 中找到：

```javascript
settings: {
    pomodoroTime: 25,  // 專注時間（分鐘）
    shortBreak: 5,     // 短休息（分鐘）
    longBreak: 15      // 長休息（分鐘）
}
```

### 修改主題顏色

在 CSS 中修改顏色變量：

```css
/* 主色調 */
--primary-color: #8B4513;  /* 棕色 */
--secondary-color: #A0522D; /* 淺棕色 */
--background-color: #FFF8DC; /* 米黃色 */
```

### 修改應用名稱

在 `manifest.json` 中修改：

```json
{
  "name": "您的應用名稱",
  "short_name": "短名稱"
}
```

---

## 🐛 常見問題

### Q: 數據會丟失嗎？
A: 數據保存在瀏覽器的 localStorage 中，只要不清除瀏覽器數據就不會丟失。建議定期使用「備份與還原」功能備份數據。

### Q: 可以在多個設備間同步嗎？
A: 目前僅支持本地存儲。雲端同步功能正在開發中。

### Q: 離線可以使用嗎？
A: 安裝為 PWA 後完全支持離線使用。所有功能在無網絡狀態下都可正常運行。

### Q: 支持哪些瀏覽器？
A: 
- ✅ Chrome 67+
- ✅ Firefox 60+
- ✅ Safari 11.1+
- ✅ Edge 79+

### Q: 如何卸載應用？
A: 
- Android: 長按圖標 → 卸載
- iOS: 長按圖標 → 移除 App
- Windows: 設定 → 應用 → 卸載
- Mac: 移到垃圾桶

---

## 📈 路線圖

### v1.1（計劃中）
- [ ] 雲端同步功能
- [ ] 推送通知
- [ ] 數據加密
- [ ] 多語言支持

### v1.2（計劃中）
- [ ] 團隊協作功能
- [ ] 數據可視化增強
- [ ] 自定義主題
- [ ] 小工具（Widget）

### v2.0（遠期規劃）
- [ ] AI 智能建議
- [ ] 社交分享功能
- [ ] 番茄鐘音樂庫
- [ ] 跨平台原生應用

---

## 🤝 貢獻

歡迎貢獻代碼、報告問題或提出建議！

1. Fork 本倉庫
2. 創建功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 開啟 Pull Request

---

## 📄 授權

本項目採用 MIT 授權。查看 [LICENSE](LICENSE) 文件了解更多信息。

---

## 📞 聯繫方式

- 📧 Email: support@orbit-app.com
- 🌐 Website: www.orbit-app.com
- 💬 Issue: [GitHub Issues](https://github.com/你的用戶名/orbit-app/issues)

---

## 🙏 致謝

- [Font Awesome](https://fontawesome.com/) - 圖標
- [Google Fonts](https://fonts.google.com/) - Noto Sans TC 字體
- [PWA Builder](https://www.pwabuilder.com/) - PWA 工具

---

<div align="center">

**用 ❤️ 打造的時間管理工具**

Made with ❤️ by Orbit Dev Team

[⬆ 回到頂部](#-orbit-時間管理應用)

</div>

