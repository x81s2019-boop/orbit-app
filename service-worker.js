// Orbit PWA Service Worker
const CACHE_NAME = 'orbit-cache-v1.0.0';
const urlsToCache = [
  './',
  './index.html',
  './manifest.json',
  // 添加其他需要緩存的資源
];

// 安裝 Service Worker
self.addEventListener('install', (event) => {
  console.log('🌲 Service Worker 安裝中...');
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => {
        console.log('✅ 緩存已打開');
        return cache.addAll(urlsToCache);
      })
  );
  self.skipWaiting();
});

// 激活 Service Worker
self.addEventListener('activate', (event) => {
  console.log('✨ Service Worker 激活中...');
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cacheName) => {
          if (cacheName !== CACHE_NAME) {
            console.log('🗑️ 刪除舊緩存:', cacheName);
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
  return self.clients.claim();
});

// 攔截請求
self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request)
      .then((response) => {
        // 緩存命中，返回緩存資源
        if (response) {
          return response;
        }
        
        // 沒有緩存，從網絡獲取
        return fetch(event.request).then(
          (response) => {
            // 檢查是否為有效響應
            if (!response || response.status !== 200 || response.type !== 'basic') {
              return response;
            }
            
            // 克隆響應
            const responseToCache = response.clone();
            
            // 將新資源添加到緩存
            caches.open(CACHE_NAME)
              .then((cache) => {
                cache.put(event.request, responseToCache);
              });
            
            return response;
          }
        );
      })
      .catch(() => {
        // 網絡和緩存都失敗，返回離線頁面
        return caches.match('./index.html');
      })
  );
});

// 處理推送通知
self.addEventListener('push', (event) => {
  const options = {
    body: event.data ? event.data.text() : '您有新的提醒！',
    icon: './icons/icon-192x192.png',
    badge: './icons/icon-72x72.png',
    vibrate: [200, 100, 200],
    data: {
      dateOfArrival: Date.now(),
      primaryKey: 1
    },
    actions: [
      {
        action: 'explore',
        title: '查看詳情',
        icon: './icons/checkmark.png'
      },
      {
        action: 'close',
        title: '關閉',
        icon: './icons/close.png'
      }
    ]
  };
  
  event.waitUntil(
    self.registration.showNotification('Orbit 時間管理', options)
  );
});

// 處理通知點擊
self.addEventListener('notificationclick', (event) => {
  event.notification.close();
  
  if (event.action === 'explore') {
    event.waitUntil(
      clients.openWindow('./')
    );
  }
});

// 後台同步
self.addEventListener('sync', (event) => {
  if (event.tag === 'sync-data') {
    event.waitUntil(syncData());
  }
});

async function syncData() {
  console.log('🔄 同步數據中...');
  // 在這裡添加數據同步邏輯
}

