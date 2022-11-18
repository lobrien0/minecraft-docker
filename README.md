# Minecraft Docker

This Repo is a Dockerfile with supporting files designed to be a light and fast containerized Minecraft server.  
Running on the alpine image, the download is quite small and overhead is minimal.

> Java Version: 19  

## Reqired

The Dockerfile reqires the following to work properly:

> A `.jar` file that has the latest version of paperMC or Branch  
> A `.tar.gz` file of Java 17 or higher

## How to Compile

Please do the following to compile the docker file:

1. Put the `Dockerfile` along with the *required* files above in the same directory (preferably with nothing else)

2. Make sure docker is installed on your system by running  
   ```Dockerfile
   docker version
   ```

3. Once the steps `1` and `2` have been done, run the command  
   ```Dockerfile
   docker build -t <tag> .
   ```  
   > The `<tag>` represents the name you'd like to give your container
