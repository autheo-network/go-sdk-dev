
###Dockerized Autheo Go SDK 

It will create docker container with Linux and everything for working with Autheo Go SDK: go 1.23.6, solc 0.8.20, examples

####How to use

Generate your GitHub developer token and place it into github_token file:
```
Open https://github.com/settings/tokens
Generate new token (classic)
Paste your token into github_token file
```

Build and start Docker container:
```
docker-compose up --build -d
```

Jump into container:
```
docker exec -it go-sdk-container sh
```

Check the versions:
```
go version        # Should be go1.23.6
solc --version    # Should be 0.8.20
```

Start developing Go code:
```
cd code 	            # Start your project here

cd go-sdk-examples/go   # Or use go-sdk examples
go run main.go
```

