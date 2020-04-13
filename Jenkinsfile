pipeline {  
    environment {
         registry = "jainparinita/aws-learning-repo"
         registryCredential = 'dockerhub'
         dockerImage = ''
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
				     dockerImage.run( -p 8888:9080 )
					 }
				 }
             }
         }
}
