FROM java:openjdk-8-jre

RUN curl -fsSL https://www.willuhn.de/products/hibiscus-server/releases/hibiscus-server-$HIBISCUS_VERSION.zip -o hibiscus-server.zip
RUN echo "$HIBISCUS_DOWNLOAD_SHA256 hibiscus-server.zip" | sha1sum -c -
RUN unzip hibiscus-server.zip -d /
RUN rm hibiscus-server.zip

RUN echo "Europe/Berlin" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080
