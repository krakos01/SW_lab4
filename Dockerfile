# etap 1
FROM scratch AS etap1

# Wykorzystuje obraz bazowy alpine
ADD alpine-minirootfs-3.20.3-x86_64.tar /

# Instaluje npm oraz nodejs
RUN apk add --update --no-cache npm

# Definicja zmiennej środowiskowej
ARG VERSION
ENV APP_VER=${VERSION:-v1}

# Katalog roboczy
WORKDIR /usr/app

# Skopiowanie i uruchomienie aplikacji do wytworzenia strony
COPY app.js .
RUN node app.js


# etap 2
FROM nginx

# Skopiowanie strony z poprzedniego etapu do katalogu domyślnego nginx
COPY --from=etap1 /usr/app/index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=1s \
 CMD curl -f http://localhost:80/ || exit 1

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]