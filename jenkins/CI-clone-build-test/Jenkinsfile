pipeline {
    agent any

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "maven3"
        jdk "jdk8"
    }

    stages {
        stage('clone') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/wkhanvisualpathit/VProfile.git'
            }
        }
        
        stage('build'){
            steps {
               // building my vprofile project
               sh "mvn package"
               //test
            }
        }
    }
}
