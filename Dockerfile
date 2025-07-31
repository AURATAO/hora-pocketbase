FROM amd64/alpine:latest

# 安裝必要工具
RUN apk add --no-cache wget unzip

# 設定工作目錄
WORKDIR /app

# 下載 Linux AMD64 版本的 PocketBase
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.22.8/pocketbase_0.22.8_linux_amd64.zip \
    && unzip pocketbase_0.22.8_linux_amd64.zip \
    && rm pocketbase_0.22.8_linux_amd64.zip \
    && chmod +x /app/pocketbase

# 建立資料儲存資料夾
RUN mkdir -p /app/pb_data

# ✅ 複製舊資料庫
COPY pb_data ./pb_data


# 開放對外 HTTP port
EXPOSE 10000

# 啟動 PocketBase，並指定資料夾存放 DB
CMD ["./pocketbase", "serve", "--http=0.0.0.0:10000", "--dir", "/app/pb_data"]