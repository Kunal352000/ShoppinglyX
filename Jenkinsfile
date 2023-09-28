pipeline{
    agent any
    
    stages{
        stage("Code"){
            steps{
                echo "Cloning the code"
                git url:"https://github.com/Kunal352000/ShoppinglyX.git" , branch:"main"
            }
        }
        stage("build"){
            steps{
                echo "Building the code"
                sh "docker build -t django-app ."
            }
        }
        stage("Push to dokcer Hub"){
            steps{ 
                echo "Pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub", passwordVariable:"dockerHubPass", usernameVariable:"dockerHubUser")]){
                 sh "docker tag django-app ${env.dockerHubUser}/django-app:latest"
                 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}" 
                 sh "docker push ${env.dockerHubUser}/django-app:latest"
                }
                
            }
        }
        stage("Deploy"){
            steps{
                echo "Deploying the container"
                // sh "docker run -d -p 8000:8000 kunaljoshi805/django-app:latest"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}