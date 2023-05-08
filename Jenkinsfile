pipeline {
    agent any
    tools {
     'maven' 'maven'
     
     'hudson.plugins.sonar.SonarRunnerInstallation' 'Sonar1'
    }
    
    stages {
        stage ('git version check') {
            steps {
                sh 'git --version'
            }
        }
        
        stage ('maven version check') {
            steps {
                sh 'mvn --version'
            }
        }
        
        stage ('git checkout stage') {
            steps {
                git 'https://github.com/Divyabd/Jenkins-Full-Course-on-aws-Linux.git'
            }
        }
        
        stage ('adding credential for SonarQ Analysis') {
            steps {
              withSonarQubeEnv(installationName:'Sonar1', credentialsId: 'sonarQcred') {
                sh 'mvn -f Maven/pom.xml clean package sonar:sonar' 
              }
            }
        }
        
        // stage ('maven test') {
        //     steps {
        //         sh 'mvn -f Maven/pom.xml clean package'
        //     }
        // }
        
        stage ('jfrog connect test') {
            steps {
                rtUpload (
                    serverId: 'jfrogCon1',
                    spec: '''{
                          "files": [
                            {
                              "pattern": "Maven/target/*.jar",
                              "target": "libs-snapshot-local/com/devopspract/DevopsMaven/1.0-SNAPSHOT/"
                            }
                         ]
                    }''',
                )
            }
        }
        
        stage ('jfrog publish test') {
            steps {
                rtPublishBuildInfo (
                serverId: 'jfrogCon1',
            )
            }
        }
    }
}
