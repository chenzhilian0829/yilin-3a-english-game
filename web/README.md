# iPad 网页版

直接在 iPad Safari 打开 `index.html` 即可使用。若 Safari 限制本地 JSON 加载，请把整个目录放到任意静态托管服务，或在电脑运行 `python -m http.server` 后用 iPad 访问局域网地址。

功能状态使用浏览器 `localStorage` 自动保存：积分、解锁关卡、错题、最近打开时间和打开次数。每次进入首页都会自动记录一次。
