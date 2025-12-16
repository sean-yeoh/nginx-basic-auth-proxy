#!/bin/sh
set -e

htpasswd -bc /etc/nginx/.htpasswd "$BASIC_AUTH_USERNAME" "$BASIC_AUTH_PASSWORD"

cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen ${PORT:-80};

    location / {
        auth_basic "Restricted";
        auth_basic_user_file /etc/nginx/.htpasswd;
        proxy_pass $PROXY_PASS;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

exec "$@"