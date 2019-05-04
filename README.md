# Berlin
Streamlined SFDX project to try out VSCode's Remote Container feature, more info about it in [Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)

## FYI
Keep the current things in mind when using SFDX & VSCode Remote Containers

- Remote containers is only available for VSCode Insiders and is a Preview feature
- You'll have to use JWT auth flow for SFDX CLI
- I've only tested this using Mac OS
- Installing the [Docker extension](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker) is very useful when debugging anything regarding docker
- Need to install the [Remote Development extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)

## Description
The Dockerfile in this project, under `.devcontainer`, will setup the following for you:

- Java JDK 8 & configure its path for vscode usage
- Install Git
- Install NodeJS v10.x
- Install Salesforce CLI
- Install all the extensions needed for SFDX
- Create a key and self-signed certificate using OpenSSL

## Setup
Clone this repo, open it using VSCode Insiders and install all the suggested extensions, the Docker & Remote Development extension pack mentioned above are part of it.

Once everything is installed, click the bottom-left green footer and select this project's Dockerfile in order for VSCode to spin up the docker container. This process will take a couple of minutes, after it you'll have to create a connected app by following [Authorize an Org Using the JWT-Based Flow](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_auth_jwt_flow.htm) and using the already created certs located under `/root/JWT`.

After this you'll be able to use the Salesforce extensions for VSCode to work on a Salesforce DX project.

## Limitations/Known Issues
- Installing extension packs is not supported yet, need to install every extension independently
- The Salesforce extensions for VSCode use a web based flow for authentication, which does not work with this configuration. Will need to use the JWT auth flow for the Salesforce CLI.
- Didn't include the Salesforce Interactive debugger since I haven't test it.
- Certain menu options (e.g. right click a log file and launch replay debugger) do not work, might be a context related issue.