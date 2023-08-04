#!/bin/bash
echo "Create credentials file"
echo "dns_cloudflare_api_token = $CLOUDFLARE_TOKEN">> /root/cloudflareapi.cfg

echo "Create SSL"
certbot certonly --dns-cloudflare --dns-cloudflare-credentials /root/cloudflareapi.cfg -d *.$DOMAIN_NAME -d $DOMAIN_NAME -m $HOSTMASTER_EMAIL --non-interactive --agree-tos --dns-cloudflare-propagation-seconds 30

echo "Connect to S3"
./mc alias set s3 $S3_ADDRESS $S3_LOGIN $S3_PASSWORD

echo "Copy files to s3"
./mc cp /etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem s3/$S3_PATH/fullchain.pem
./mc cp /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem s3/$S3_PATH/privkey.pem

echo "Send report"
cat /var/log/letsencrypt/letsencrypt.log | mail -s 'Update SSL' -A /etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem -A /etc/letsencrypt/live/$DOMAIN_NAME/privkey.pem $HOSTMASTER_EMAIL
