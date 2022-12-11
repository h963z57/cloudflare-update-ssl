# Cloudflare update ssl

For run container :
> docker run -it -t \
--env CLOUDFLARE_TOKEN='SECRETOKEN' \
--env DOMAIN_NAME='example.com' \
--env HOSTMASTER_EMAIL='hostmaster@example.com' \
--env S3_ADDRESS='https://s3.example.com:9000' \
--env S3_LOGIN='mylogin' \
--env S3_PASSWORD='mypassword' \
--env S3_PATH='bucket/SSL_directory' \
h963z57/cloudflare_update_ssl:main
