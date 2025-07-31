FROM debian:bullseye-slim

# 安裝必要工具
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# 下載 PocketBase Linux 版本
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.22.11/pocketbase_0.22.11_linux_amd64.zip -o pb.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

# 暴露 Render 會用的 PORT
EXPOSE 8080

# 啟動命令
CMD ["./pocketbase", "serve", "--http", "0.0.0.0:8080"]
