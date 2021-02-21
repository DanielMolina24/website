#!/bin/bash
# Run the nginx server with http basic auth configured via env vars

# Err if http basic auth is not configured via $HTPASSWD
if [[ -z "$HTPASSWD" ]]; then
    echo "Must set HTPASSWD in environment" 1>&2
    exit 1
fi

# Copy http basic auth from env to file system
# $HTPASSWD contains the content of the file generated by htpasswd
mkdir /usr/share/nginx/auth
echo $HTPASSWD > /usr/share/nginx/auth/.htpasswd
echo "added .htpasswd to enable http basic auth"

echo "starting nginx"
nginx -g 'daemon off;'