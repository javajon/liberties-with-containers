This project is in draft and it may or may not work.

Fission is a Functions as a Service (FaaS) / Serverless function framework built on Kubernetes.

Fission allows you to easily create HTTP services on Kubernetes from functions. It works at the source level and abstracts away container images (in most cases). It also simplifies the Kubernetes learning curve, by enabling you to make useful services without knowing much about Kubernetes.

Fission is in Alpha and comes from the Platform9 community.

See [Reference these Fission.io instructions](https://github.com/fission/fission/blob/master/INSTALL.md)

1. Install 
   a. Kubernetes (Minikube is a good start)
   b. KubeCtl
   c. Set your environment to the Minikube context with `eval $(minikube docker-env)`
   d. Install the Fission CLI tool
   
Install the Fission client CLI   

Mac OS:

`curl -Lo fission https://github.com/fission/fission/releases/download/nightly20170705/fission-cli-osx && chmod +x fission && sudo mv fission /usr/local/bin/`

Linux:

`curl -Lo fission https://github.com/fission/fission/releases/download/nightly20170705/fission-cli-linux && chmod +x fission && sudo mv fission /usr/local/bin/`

Windows: [fission.exe](https://github.com/fission/fission/releases/download/nightly20170705/fission-cli-windows.exe)


----
   
2. Setup Fission engine

`kubectl create -f https://github.com/fission/fission/releases/download/nightly20170705/fission-rbac.yaml`
`kubectl create -f https://github.com/fission/fission/releases/download/nightly20170705/fission-nodeport.yaml`
  
An optional UI is available:

`kubectl create -f https://raw.githubusercontent.com/fission/fission-ui/master/docker/fission-ui.yaml`

Then open http://node-ip:31319 to use Fission-ui.  
  
3. Set the context

`export FISSION_URL=http://$(minikube ip):31313`
`export FISSION_ROUTER=$(minikube ip):31314`




4. Example: A hello world Fission example

Create
```
cat > hello.py
def main(context):
    print "Hello, world!"
```
Publish
```
fission function create --name hello --env python --code hello.py --url /hello
```
Use
```
curl http://<fission router>/hello
Hello, world!
```

5. Another Fission example

`fission env create --name nodejs --image fission/node-env`

`curl https://raw.githubusercontent.com/fission/fission/master/examples/nodejs/hello.js > hello.js`

`fission function create --name hello --env nodejs --code hello.js`
  
`fission route create --method GET --url /hello --function hello`
  
`curl http://$FISSION_ROUTER/hello`
