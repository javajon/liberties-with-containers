Here is a great way to perform a static code analysis. The advantage of setting
up a local service is analsysis can be completed before code
commits and pull requests and peer reviews. Also this offers an
IDE and build agnostic set of eyes on your code. Putting SonarQube
in a container also makes it easy to start, stop and update.

1. Install 
   a. Kubernetes (Minikube is a good start)
   b. KubeCtl
   c. Set your environment to the Minikube context with `eval $(minikube docker-env)`

2. Create the a `sonar` namespace.
`kubectl create namespace sonar`

3. Postgres will need a password, so this command will register the secret:
`kubectl create secret --namespace sonar generic postgres-pwd --from-file=./password"

4. Deploy the SonarQube server to your Kubernetes cluster.
`kubectl create --namespace sonar -f .`

4. It will take a bit of time for the containers to start the first time and 
you can check the status with either of these commands:
`kubectl get pods,service --namespace sonar`
`minikube dashboard`

5. Once start you can see the SonarQube dashboard in action with: 
'minikube service --namespace sonar SonarQube-service'

6. At this point there is no project. If you checkout the 
github project 'pact-with-kubernetes' there is a folder in there called
'ms-cities'. Ms-cities is a Gradle project that already has SonarQube
added as a Gradle plugin and it will publish the code analysis results
your your running SonarQube container.

7. Obtains the URL of the SonarQube service with:
'SQ_URL = $(minikube service --namespace sonar SonarQube-service --url)'

8. Run the analysis and publish the results.
`cd ../pact-with-kubernetes/ms-cities`
`./gradlew -Dsonar.host.url="$SQ_URL" sonarqube`

Once the SonarQube dashboard is running dive into the project and 
look for the code smells. Try fixing some smells and run the analysis again.

To further explore SonarQube checkout the analysis of 4,343
open source projects here at [SonarCloud.io](https://sonarcloud.io/projects?sort=-analysis_date).
