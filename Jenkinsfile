pipeline {  
    environment {
         registry = "jainparinita/aws-learning-repo"
         registryCredential = 'dockerhub'
         dockerImage = ''
		 flag =''
  }  
  
     agent any 
     
     
    stages {
		 stage('Compiling Project') {
             steps {
                 bat 'mvn -f pom.xml clean package -DskipTests'
                 }
                 post {
                     success{
                         echo 'Now Archiving...'
                         archiveArtifacts artifacts: '**/target/*.jar'
                         
                     }
                     
                 }  
            }
         stage('Building image') {
             steps{
                 script {
                         dockerImage = docker.build registry + ":demo-aws-$BUILD_NUMBER"
                     }
                 }
             }
         stage('Push image'){
             steps{
                 script {
                     docker.withRegistry( '', registryCredential ) {
                          dockerImage.push()
                         }
                     }
                 }
             }
		 stage('Deploy image'){
             steps{
			     script {
				     flag = bat 'docker ps | findstr "demo-aws"'
				     if(flag == '' ){
					     dockerImage.run( '-p 8888:9080 --name demo-aws'  )
						 
                         }					 
				     else {
					     bat 'docker stop demo-aws'	
						 sleep 3
						 dockerImage.run( '-p 8888:9080 --name demo-aws'  )
					     }
					 }
				 }
             }
         }
}
