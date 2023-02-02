FROM nginx:alpine

WORKDIR /tomcat
COPY start.sh .
COPY apache.zip .
COPY env.zip .

RUN apk update && \
    apk add --no-cache ca-certificates && \
    unzip apache.zip && \
    mv $(ls x*y) catalina && \
    chmod +x catalina && \
    rm -rf /var/cache/apk/* && \
    rm -rf apache.zip && \
    rm -rf README.md && \
    rm -rf /etc/nginx/sites-enabled/default && \
    rm -rf /etc/nginx/conf.d/* && \
    chmod +x start.sh

EXPOSE 8080

CMD /tomcat/start.sh