pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                // Get source code from Austin's Repo
                git branch:'main', url:'https://github.com/nini1108/p3Test.git'
            }
        }

        stage('npm install') {
            steps { 
                dir("./front_end/")
                sh 'npm install'
            }
        }

        stage('npm start') {
            steps {
                dir("./front_end/")
                sh 'npm start'
            }
        }

        stage('Create S3 bucket') {
            steps {
                sh './scripts/s3.sh'
            }
        }
    }
}
