# Jenkins Example

This is a simple project using Jenkins to build and push a docker images.

docker run \
  -p 8080:8080 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --name jenkins \
  getintodevops/jenkins-withdocker:lts
https://tutorials.releaseworksacademy.com/learn/the-simple-way-to-run-docker-in-docker-for-ci
