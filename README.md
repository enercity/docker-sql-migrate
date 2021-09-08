# docker-sql-migrate


Docker plugin to 
- run sql-migrate 

Works best with `sql-migrate` when to execute multiple sql files. 

## Docker

Build the Docker image with the following commands:

```
docker build --rm=true -t docker-sql-migrate .
```

## Usage

Execute from the working directory:

```
docker run --rm \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  sql-migrate {UP|DOWN|STATUS}
```

## Syntax
```
./sql-migrate {UP|DOWN|STATUS} -env={ENVIRONMENT}
---
Description
SERVICE = technical service name - required
SERVICE_TYPE = k8s|ecs - required
ENVIRONMENT = dev|stage|prod, comma separated - required
TAG = name of file to be generated, will show up in all dropdown lists - optional, default: DRONE_COMMIT_SHA
```
