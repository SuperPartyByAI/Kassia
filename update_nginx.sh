cat << 'NGINX_CONF' > /etc/nginx/sites-available/kassia.ro
server {
    server_name www.kassia.ro;

    location / {
        proxy_pass http://127.0.0.1:3050;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;

        # Force aggressive anti-caching for all proxies/browsers
        add_header Cache-Control "no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0" always;
        add_header Pragma "no-cache" always;
        add_header Expires "0" always;
    }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/kassia.ro/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/kassia.ro/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
    server_name kassia.ro;
    listen 443 ssl; # managed by Certbot

    ssl_certificate /etc/letsencrypt/live/kassia.ro/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/kassia.ro/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    return 301 https://www.kassia.ro$request_uri;
}

server {
    if ($host = www.kassia.ro) {
        return 301 https://www.kassia.ro$request_uri;
    } # managed by Certbot

    if ($host = kassia.ro) {
        return 301 https://www.kassia.ro$request_uri;
    } # managed by Certbot

    listen 80;
    server_name kassia.ro www.kassia.ro;
    return 404; # managed by Certbot
}
NGINX_CONF

systemctl reload nginx
