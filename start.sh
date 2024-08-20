#!/bin/sh

# This file helps the nginx_proxy container start properly with crond and certbot.

# Start crond in the background
crond

# Start nginx in the foreground
nginx -g "daemon off;"
