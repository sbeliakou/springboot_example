## Spring Boot Sample Application

### Buld and Package Application
```
docker build -t myspringbootapp .
```

### Just Build Application JAR
```
docker build -t myapp --target builder .
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