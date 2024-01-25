FROM alpine:latest

# Install curlt
RUN apk add --no-cache curl

# Copy Scripts to Docker Image
COPY ./cronjobs /usr/local/bin/

# Add the cron job

RUN echo ' */30  *  *  *  * /usr/local/bin/renew.sh' >> /etc/crontabs/root

# Run crond  -f for Foreground
CMD ["/usr/sbin/crond", "-f"]
