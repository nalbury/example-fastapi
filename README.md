# Example FastAPI DevEnv

The actual code for this project is largely pulled from sections of the FastAPI docs. It's intended to simply be a demo app for developing various SDLC patterns/tools.

## Development Environment(s)
This project leverages [devcontainers](https://containers.dev/) to faciliate a suite of different development environment choices.
Each of the following can be run either locally or via Github Codespaces using your IDE of choice: 
- Single devcontainer (just the app, no infrastructure dependencies)
- Docker compose devcontainer (app + infrastructure dependencies in docker)
- Single devcontainer + [MirrorD](https://mirrord.dev/) for developing against a k8s cluster (app in docker + infrastructure dependencies in k8s)

### Single Devcontainer
This environment leverages the `devcontainer` stage of the application's Dockerfile to build a single container env with the application + it's python dependencies. It's intended for simple edits/changes which don't require testing against any other services/data stores. 

**NOTE** This is the default devcontainer config which will be run if no alternate configuration is selected.

### Docker Compose Devcontainer
The docker compose based devcontainer environment builds the same application image as the Single devcontainer but with an additional pair of containers for running postgres + pgweb respectively. This allows for application scoped dev/test workflows which require an actual database.

### Single Devcontainer + MirrorD
This option is the most feature packed of the bunch as it allows for a complete prod like environment in a kubernetes cluster running either locally (e.g. k3d) or in the cloud (e.g. GKE). To accomplish this, all application infra (databases etc.), configuration, and networking is first configured in the k8s cluster as if it were a real deployment. Once that's running, [MirrorD](https://mirrord.dev/) can then be used to route all traffic to/from the local devcontainer as if it were a pod running in the cluster.

**TODO** Document this workflow (deploying dev cluster, installing app, running mirrord from devcontainer etc.)


### Tested options for running Devcontainers:
- [VSCode](https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-an-existing-folder-in-a-container) (RECOMMENDED)
- [IntelliJ (and other Jetbrains Editors)](https://www.jetbrains.com/help/idea/connect-to-devcontainer.html) (very beta)
- [Official Devcontainer CLI](https://github.com/devcontainers/cli) (reference implementation)
- [Devpod](https://devpod.sh/) (supports almost all major IDEs + VIM)
- [Github Codespaces](https://github.com/features/codespaces) (supports almost all major IDEs)

Neovim also has two plugins available for devcontainers but they're untested with this project:
- https://github.com/esensar/nvim-dev-container
- https://github.com/jamestthompson3/nvim-remote-containers
