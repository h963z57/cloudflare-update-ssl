#--------------------------------------------------------
# Dockerfile to build Imgage of TestSiteBackend
#
# Made by h963z57 16-Sep-2022
#--------------------------------------------------------

FROM debian:latest

COPY ./entrypoint.sh /entrypoint.sh

RUN touch /root/cloudflareapi.cfg \
  && chmod 400 /root/cloudflareapi.cfg \
  && chmod a+x /entrypoint.sh

RUN apt-get update && apt-get install python3-pip wget -y \
  && pip3 install certbot-dns-cloudflare --no-cache-dir \
    && wget https://dl.min.io/client/mc/release/linux-amd64/mc \
    && chmod +x mc

ENTRYPOINT ["/bin/bash"]

##ENTRYPOINT ["/entrypoint.sh"]
