# docker-maven-java-example
A docker-compose enabling cache on maven container so we don't wait for downloads again and again.

## How to use 
Modify the ARTIFACT_ID in the docker-compose.yml with what's in your pom.xml.  
```
docker-compose build        # build both images.
docker-compose up maven     # re-compiles the .jar file.
docker-compose up java      # executes your code.
docker-compose restart java # restarts your code if container was already up before recompilation.
```

## Why did I do this
After some googling, I figured people would either use the [maven docker plugin](https://github.com/spotify/docker-maven-plugin) from spotify, which I didn't want to use since I like my configuration in docker-related files. Or they would use one Dockerfile with two stages, first one for maven to compile the code, second one for java to run the code. This method works fine but I was annoyed by the fact that I needed to re-download all the maven dependencies everytime I was compiling.

## How does it work
According to [maven's image documentation](https://hub.docker.com/_/maven?tab=description), you can mount a volume in the container to use cache for dependencies.  
So I just did that then I split the maven container and the java one. They both share another volume so the second one can access the .jar file.  
I also moved the `mvn package` command to the entrypoint since I wanted the container to access the volume I was mounting on it. I'm not an expert at docker, so there might be other ways to do that.