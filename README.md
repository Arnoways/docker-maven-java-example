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