# Example FastAPI DevEnv

The actual code for this project is largely pulled from sections of the FastAPI docs. It's intended to simply be a demo app for developing various SDLC patterns/tools.

## Running locally
This project leverages the [example localdev network stack here](https://github.com/nalbury/example-localdev-network) to run a python fastAPI + PostgreSQL app in a local dockerized dev env. 

To run the app locally, first clone and run the example local dev network stack:
```bash
git clone https://github.com/nalbury/example-localdev-network
cd example-localdev-network
docker compose up -d
```

Once the network is running, point your workstation's DNS configuration at your localhost IP. On macOS this can be done with the following command:
```bash
networksetup -setdnsservers Wi-Fi 127.0.0.1
```
**NOTE**
Don't forget to reset this when you're done by running:
```bash
networksetup -setdnsservers Wi-Fi Empty
```

Last but not least, you can run the app by running `docker compose up` from the repo root directory. This will launch the server, run the required DB migrations, and start the application. 

You can interact with the app and view its API docs by going to http://example-fastapi.dev.local/docs in your browser (requires the DNS and reverse proxy from the example local dev network stack).

### Dev Containers

In addition to the standard docker-compose deployment, a `devcontainer.json` file is provided in the `.devcontainer/` directory, which will run a development oriented environment inside of the app's container image. This can be run by simply opening the app in a supported IDE (see below) and using their respective devcontainer extension/plugin.

Supported IDEs:
- [VSCode](https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-an-existing-folder-in-a-container)
- [IntelliJ (and other Jetbrains Editors)](https://www.jetbrains.com/help/idea/connect-to-devcontainer.html)

Neovim also has two plugins available for devcontainers but they're untested with this project:
- https://github.com/esensar/nvim-dev-container
https://github.com/jamestthompson3/nvim-remote-containers

Devcontainers can also be managed without VSC


