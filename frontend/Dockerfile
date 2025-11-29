FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# انسخ ملفات الفرونت (index.html, script.js, style.css, ... الخ)
COPY . .

# نضيف entrypoint يكتب app-config.js بناءً على BACK_HOST
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
