# 前端建置（React 或 Vite 都可）
FROM node:18-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# 用 nginx serve 靜態檔案
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
