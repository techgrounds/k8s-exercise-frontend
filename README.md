# k8s-exercise-frontend
Companion app for exercise https://github.com/techgrounds/Cloud-Curry/blob/main/Containerization/netflix.md

This repository aims to provide a frontend for the Netflix Clone exercise in a container. It contains the tools to build the frontend-container and make it available through gcr.io.

## Usage
React apps are a popular framework for building a frontend. It allows one to host just static content and have the client render on the client site. This will cause some troubles when you need to interact with a backend with an uncertain address. 

## For your assignment
You should do the following:
- Clone this repository through GitHub Desktop or simple `git clone https://github.com/techgrounds/k8s-exercise-frontend.git`.
- Edit the `image: "k8s-exercise-frontend"` in the `docker-compose.yml` file to include your username on DockerHub like: `image: "your-username/k8s-exercise-frontend"`.
- Edit the `DOMAIN=""` element inside the `docker-compose.yml` file to your IP address.
- Run `docker-compose build` to build the frontend-container.

Next step depends on where you are running the exercise.  
If you are running the exercise on your own machine you can simply put in `your-username/k8s-exercise-frontend` as the name of the container of your Helm chart.  
If you are running the exercise on an external machine, you must push the container to your DockerHub account. And then use the name of the container you pushed to your [DockerHub account(https://docs.docker.com/docker-hub/)] inside your Helm-chart like `your-username/k8s-exercise-frontend`.
