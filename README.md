
###Dockerized Autheo Go SDK 

Will create docker container with Linux and everything for working with Autheo Go SDK: go 1.23.6, solc 0.8.20

####How to use

Build and start Docker container:
```
docker-compose up --build -d
```

Jump into container:
```
docker exec -it go-solc-container sh
```

Check the versions:
```
go version        # Should be go1.23.6
solc --version    # Should be 0.8.20
```

Start developing Go code:
```
cd code 	# Start your project here or use go-sdk examples:
git clone https://github.com/autheo-network/go-sdk-examples.git
cd go-sdk-examples/go
go run main.go
```

