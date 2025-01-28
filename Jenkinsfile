pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/sunnygodiwal1991/python-project-repo.git'
        BRANCH = 'master'
    }

    stages {
        stage('Hello') {
            steps {
                script {
                    git url: "$GIT_REPO", branch: "$BRANCH"
                }
            }
        }
        stage('Build & Push') {
            steps {
                script {
                    sh ''' 
                        aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 223733897421.dkr.ecr.ap-south-1.amazonaws.com
                        docker build -t python-ecr-repo .
                        docker tag python-ecr-repo:latest 223733897421.dkr.ecr.ap-south-1.amazonaws.com/python-ecr-repo:latest
                        docker push 223733897421.dkr.ecr.ap-south-1.amazonaws.com/python-ecr-repo:latest
                    '''
                }
            }
        }
        stage('Deployment') {
            steps {
                script {
                    sh ''' 
                        sudo kubectl apply -f .
                    '''
                }
            }
        }
    }
}
