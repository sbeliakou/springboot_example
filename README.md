## Spring Boot Sample Application

### Buld Application
```
docker build -t myspringbootapp .
```

### Run Application
```
docker run --name mySBoot -d -P -e APP_STARTER="Siarhei Beliakou" myspringbootapp
```

### Testing Page
```
docker ps -l
docker port $(docker ps -lq)
curl localhost:$(docker port $(docker ps -lq)|cut -d: -f2)
```