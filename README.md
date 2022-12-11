# Cloudflare update ssl

For run container :
> docker run -d -t h963z57/cloudflare_update_ssl:main \
-e CLOUDFLARE_TOKEN=supersecretoken \
-e DOMAIN_NAME=example.com \
-e HOSTMASTER_EMAIL=hostmaster@example.com \
-e S3_ADDRESS=https://s3.example.com:8080 \
-e S3_LOGIN=mylogin \
-e S3_PASSWORD=mypassword
