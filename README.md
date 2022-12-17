# simple-devenv-py

Simple development environment for Python.

It creates a container running VS Code Server so you can access it from clients like VS Code or browsers.

Related post (Japanese): [VS Code Serverでリモートホストあコンテナ上開発環境に直接アクセスする](https://sogo.dev/posts/2022/12/vscode-server-devcontainer)

## Getting Started

### Prerequisites

* docker / docker compose

### Set up

Start a container.

```
docker compose build
docker compose up -d
```

Then check the log output.

```
docker compose logs -f
```

You can see a URL and a code, open https://github.com/login/device and authenticate.

```
simple-devenv-py-app-1  | To grant access to the server, please log into https://github.com/login/device and use code xxxx-xxxx
```

Once the authentication process has been done, the tunnel will be created.

```
simple-devenv-py-app-1  | [2022-12-17 09:06:03] info Creating tunnel with the name: dazzling-antshrike
simple-devenv-py-app-1  | 
simple-devenv-py-app-1  | Open this link in your browser https://insiders.vscode.dev/+ms-vscode.remote-server/dazzling-antshrike/workspace
```

Now you can connect the remote environment using VS Code or browser.
