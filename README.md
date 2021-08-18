# docker-kustomize

Docker plugin to 
- run kustomize 
- run kustomize-lqt to generate multiple manifests in a single command

Works best with `docker-kubeval-lqt` when to validate multiple manifests at once. 

## Docker

Build the Docker image with the following commands:

```
docker build --rm=true -t docker-kustomize .
```

## Usage

Execute from the working directory:

```
docker run --rm \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  kustomize-lqt {SERVICE} {SERVICE} {ENVIRONMENT} {TAG}
```

## Syntax
```
./kustomize-lqt {SERVICE} {SERVICE_TYPE} {ENVIRONMENT} {TAG}
---
Description
SERVICE = technical service name - required
SERVICE_TYPE = k8s|ecs - required
ENVIRONMENT = dev|stage|prod, comma separated - required
TAG = name of file to be generated, will show up in all dropdown lists - optional, default: DRONE_COMMIT_SHA
```