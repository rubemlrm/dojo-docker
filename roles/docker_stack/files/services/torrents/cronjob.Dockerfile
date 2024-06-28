FROM ghcr.io/linuxserver/baseimage-alpine:3.20

# Install curl
RUN apk add --no-cache curl

# Copy Scripts to Docker Image
COPY ./cronjobs /usr/local/bin/
RUN chmod +x /usr/local/bin/renew.sh

# Add the cron job
RUN echo ' */30  *  *  *  * /usr/local/bin/renew.sh' >> /etc/crontabs/root
RUN crontab /etc/crontabs/root

# Run crond  -f for Foreground
CMD ["/usr/sbin/crond", "-f"]
