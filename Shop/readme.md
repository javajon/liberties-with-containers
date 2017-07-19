The project is based on the great work from the software architect 
[**Bernd Zuther**](https://github.com/zutherb).

[This example](https://github.com/zutherb/AppStash/tree/543d00282875c2dce64e788b265a0f3b3fc217e2/kubernetes/example/shop) 
was published back in 2015 and still runs today, despite all the improvements 
with the Kubernetes ecosystem. It's a seemly simple shopping application, but 
leverages many helpful ideas about running Microservices in Kubernetes. It 
includes microservice code along with Redis and a MongoDB.  

1. Install 
   a. Kubernetes (Minikube is a good start)
   b. KubeCtl
   c. Set your environment to the Minikube context with `eval $(minikube docker-env)`

2. Create the a `shop` namespace.
`kubectl create namespace shop`

3. Deploy the Shop application to your Kubernetes cluster.
`kubectl create --namespace shop -f .`

4. Check the status. It will take a bit of time for the containers to start the first time and 
you can check the status with either of these commands:
`kubectl get pods,service --namespace shop`
`minikube dashboard`

5. Once start you can see Shop in action with: 
'minikube service --namespace shop shop-service'

A great way to play with the resilience of Kubernetes is once the applicaton
is running in your browser add some items to your shopping cart. Next, go to 
the Kubernetes dashboard and delete the Catalog pod running instance. Click 
refresh on the application quick and notice the catalog items are missing. Wait 
for Kubernetes to recover the Cart service and after refreshing notice your 
items come back. This is a good example of how to write fault tollerant UIs 
with resilient microservice based containers.
