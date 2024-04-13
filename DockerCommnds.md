## Basic docker commands
<strong>
1. docker ps -a                # Lists containers (and tells you which images they are spun from)<br>
2. docker images               # Lists images <br>
3. docker rm <container_id>    # Removes a stopped container<br>
4. docker rm -f <container_id> # Forces the removal of a running container (uses SIGKILL)<br>
5. docker rmi <image_id>       # Removes an image <br>
                            # Will fail if there is a running instance of that image i.e. container
                            <br>
6. docker rmi -f <image_id>    # Forces removal of image even if it is referenced in multiple repositories, <br>
                            # i.e. same image id given multiple names/tags <br>
                            # Will still fail if there is a docker container referencing image
    </strong>
