# Liberties with Containers #

This project is a collection of though provoking ways you can leverage containers.  

Aha moments with apps in containers can be quite liberating. The mobile space is 
saturated with “there's an app for that”. For us, we now expect “there's a container 
for that”. “Write once, run anywhere” (WORA) has changed to “Package once, 
run anywhere” (PORA).

| Containers                                                                   |
| ----------------- | -------------------------------------------------------- |
| Ping              | A simple ping to get started                             |
| R Shiny           | How a complex statistical ecosystem can be containerized |
| SonarQube         | How SonarQube can be containerized as leveraged for static code analysis |
| RabbitMQ          | A quick startup example                                  |
| Shop              | An adoption of ?? Shop application                       |
| FaaS with Fission | An example of how the functional programming community is leveraging Kubernetes |

## Where Do I Start? ##

Start with the Ping example and work your way down the above list. 

  
## How do I get set up? ##

The cluster runs on Kubernetes. Here we use the 
[Minikube solution](https://kubernetes.io/docs/getting-started-guides/minikube/) 
to set up a simple Kubernetes cluster. You should be able to run this project 
on Windows, OS X or Linux based on your preferences.


### Installs ###

* Install VirtualBox, this is an ideal virtual machine manager for Minikube
* Install Minikube
* Install KubeCtl
* Ensure you have a command prompt that can run Bash scripts, on Windows Git 
Bash, ConEmu or Cmder can work well.

### Start Kubernetes ###

* In the project directory run the `start.sh` script. Before starting view the script to see what it does
* Minikube will be running in a few minutes.
* When its running, source the env.sh file with ". ./env.sh". For each command prompt that interacts with Minikube you must always first source the env.sh script (you can add this sourcing to your .bash_profile)
* Kubernetes will now be running several support services including a dashboard and heapster as a resource monitor.
* Type `minikube status` to ensure its running.
* Type `minikube dashboard` to explore its state. 

### Sub-Projects ###

* See the readme in each sub project to try each solution.
* Each solution is deployed to an namespace that matches the project namespace
* To free resources on the cluster simply remove the namespace with `kubectl delete namespace [name]`

This project was tested using Minikube v0.20.0 with Kubernetes V1.7.0

### Credits and References ###

* [VirtualBox](https://www.virtualbox.org/wiki/VirtualBox)
* [Minikube](https://github.com/kubernetes/minikube)
* [Gradle](https://gradle.org)
* [Kubernetes](https://kubernetes.io)
* [Docker](https://www.docker.com)
* [Docker private registry](https://docs.docker.com/registry/)
* [Linux Alpine Containers](https://hub.docker.com/_/alpine/)

### How do I shut down? ###

* You can suspend Minikube and the entire cluster with `minikube stop`
* You can also just delete the Kubernetes namespaces with `kubectl delete namespace [name]`
* The easiest way to start fresh is `minikube delete`. This will 
remove the whole Minikube installation from the virtual machine and can always be recreate with the `start.sh` script.
