
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

Start developing Go code inside the container:
1. Open VS Code or any preferred / popular IDE
2. If VS Code, then download Remote Explorer, Remote Development, Remote SSH, Dev Containers and Remote Tunnels

Access terminal inside the container and / or Run examples provided by the Autheo team:
```
docker exec -it go-sdk-container sh     # Login to the container to use CLI

```
Alternatively, if you use VS Code Remote Explorer Extension
1. Click on the Remote Explorer Extension in the left menu bar in VS Code
2. You should see the Container go-sdk-container under the Dev Containers drop-down
3. You can scroll over to the go-sdk-container listed and you will see 3 options; the second option is Attach in New Window; click on it
4. This will open another VS Code Window
5. In the Explorer of the new VS Code Window you will see a bunch of files with go as one of the folders
6. Expand the go folder to view go/src/app to see go-sdk and go-sdk-examples github repo already cloned
7. You can open a terminal in this new VS Code Window which is a terminal inside of the Container
8. Run the following in the terminal to execute an Autheo provided example

```
cd go-sdk-examples/go   # Or use go-sdk examples
go run main.go
```
9. You can also git clone repo(s) of your own apps for Developing using Autheo go-sdk
```
git clone <path_to_your_repo_git>
```

