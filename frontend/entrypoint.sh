#!/bin/sh

# نولّد ملف app-config.js جوه نفس المسار اللي index.html بيستخدمه
cat <<EOT > /usr/share/nginx/html/app-config.js
window._backhost_ = {
  host: "${BACK_HOST}"
}
EOT

nginx -g "daemon off;"
