An introductory example for running a container.

1) Install
   a. Docker
   b. Kubernetes (Minikube is a good start) and set your environment to the Minikube context with `eval $(minikube docker-env)`

2) Create the Docker image defined by the Dockerfile 
`docker build -t test .`

3) Run the Docker container
`docker run test`

4) You can override the default CMD (arguments) for the image with this:
`docker run test -c 2 www.gmail.com`
