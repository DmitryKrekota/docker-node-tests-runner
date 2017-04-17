# Dockerfile for Node/Karma tests in Chrome

How to use (bitbucket-pipelines.yml):
```
image: dmitrykrekota/docker-node-tests-runner

pipelines:
    default:
        - step:
            script:
                - ln -s /node_modules ./node_modules
                - npm run tests
```

How to build and push:
```
docker build -t docker-node-tests-runner .
docker images
docker run -it dea294fde294
docker tag dea294fde294 dmitrykrekota/docker-node-tests-runner:latest
docker login
docker push dmitrykrekota/docker-node-tests-runner
```