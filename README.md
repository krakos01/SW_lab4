Dawid Krajewski, 97646

##Sprawozdanie
### 1.Treść pliku Dockerfile:
[Dockerfile](Dockerfile)

### 2. Użyte polecenie do budowy obrazu i wynik jego działania:
```
docker build -f .\Dockerfile -t local/zdw:v1.2 --build-arg VERSION=1.2 .

[+] Building 2.1s (13/13) FINISHED                                                                 docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                               0.0s
 => => transferring dockerfile: 752B                                                                               0.0s
 => [internal] load metadata for docker.io/library/nginx:latest                                                    0.0s
 => [internal] load .dockerignore                                                                                  0.0s
 => => transferring context: 2B                                                                                    0.0s
 => [stage-1 1/2] FROM docker.io/library/nginx:latest@sha256:28402db69fec7c17e179ea87882667f1e054391138f77ffaf0c3  1.7s
 => => resolve docker.io/library/nginx:latest@sha256:28402db69fec7c17e179ea87882667f1e054391138f77ffaf0c3eb388efc  1.7s
 => [internal] load build context                                                                                  0.0s
 => => transferring context: 85B                                                                                   0.0s
 => [auth] library/nginx:pull token for registry-1.docker.io                                                       0.0s
 => CACHED [etap1 1/5] ADD alpine-minirootfs-3.20.3-x86_64.tar /                                                   0.0s
 => CACHED [etap1 2/5] RUN apk add --update --no-cache npm                                                         0.0s
 => CACHED [etap1 3/5] WORKDIR /usr/app                                                                            0.0s
 => CACHED [etap1 4/5] COPY app.js .                                                                               0.0s
 => CACHED [etap1 5/5] RUN node app.js                                                                             0.0s
 => CACHED [stage-1 2/2] COPY --from=etap1 /usr/app/index.html /usr/share/nginx/html/index.html                    0.0s
 => exporting to image                                                                                             0.1s
 => => exporting layers                                                                                            0.0s
 => => exporting manifest sha256:713b5164690fc0e6e6f279ac1fea55279c24a8a5f3879bfebfa71c510ac4f467                  0.0s
 => => exporting config sha256:95902b6f91279865ae5bc98ca3d04c58866c2e930f9696439f45dfc3d0228b48                    0.0s
 => => exporting attestation manifest sha256:85e7b0c94978778c6efdb55b5dd4942e068e5c6a6574c8b1861b593cd15ce45d      0.0s
 => => exporting manifest list sha256:46c2e5c2805bf7f9481a24b5259e8450298043507828bf9f4ebeb8d6e49c0f87             0.0s
 => => naming to docker.io/local/zdw:v1.2                                                                          0.0s
 => => unpacking to docker.io/local/zdw:v1.2                                                                       0.0s

View build details: docker-desktop://dashboard/build/desktop-linux/desktop-linux/u7kkdqi8en5qildor98vcqsbm

What's next:
    View a summary of image vulnerabilities and recommendations → docker scout quickview
```

### 3. Polecenie uruchamiające serwer
`docker run -p 80:80 --name ZadDoWykonania local/zdw:v1.2`

### 4. Polecenie potwierdzające działanie kontenera i poprawne funkcjonowanie opracowanej aplikacji
```
docker ps
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS                        PORTS                NAMES
95cb41374b44   local/zdw:v1.2   "nginx -g 'daemon of…"   About a minute ago   Up About a minute (healthy)   0.0.0.0:80->80/tcp   ZadDoWykonania
```

### 5. Zrzut ekranu potwierdzający, że aplikacja realizuje wymaganą funkcjonalność
![Screenshot](https://github.com/user-attachments/assets/385f940f-f100-495f-aca7-d033d052c1f2)
