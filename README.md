# Dockerfile for Node/Karma tests in Chrome

```
docker build -t docker-node-tests-runner .
docker images
docker run -it dea294fde294
docker tag dea294fde294 dmitrykrekota/docker-node-tests-runner:latest
docker login
docker push dmitrykrekota/docker-node-tests-runner
```

```
ln -s /node_modules ./node_modules
```