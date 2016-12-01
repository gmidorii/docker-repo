### 概要
```
docker build -t [IMAGE] ./
docker run -d -p 80:8888 -it --name [CONTAINER] [IMAGE]
```

### 注意
dummyfileを更新することで最新版のリポジトリを取得します

### Dockerコマンドメモ
```
CTRL + p + q : コンテナを停止せずにexit
docker inspect [CONTAINER]
docker commit [CONTAINER] [REPOSITORY[:TAG]]
docker images | awk '/<none/{print $3}' | xargs docker rmi
```
