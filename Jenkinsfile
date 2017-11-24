pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'mvn install dockerfile:build'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                dockerProcess=`docker ps|grep $app|awk \'{print $1}\'`;
				if [ -n "$dockerProcess" ]
				then
					docker stop $dockerProcess	
					echo "docker process "$dockerProcess" stopped"
				fi
				docker run -p 5050:8080 -t $app &
                '''
            }
        }
    }
}
