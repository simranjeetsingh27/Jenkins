pipeline {
    agent any
    parameters {
        choice(name: 'CHOICE', choices: ['clean','validate', 'compile','test','package','install'], description: 'Pick any choice')
    }
    stages {
        stage('git clone') {
            steps {
                echo 'clone from repo spring3'
                git 'https://github.com/opstree/spring3hibernate.git'
            }
        }
        stage('maven validate') {
            when {
                environment name: 'CHOICE', value: 'validate'
            }
            steps {
                echo 'for validate'
                sh 'mvn validate'
            }
        }
        stage('maven compile') {
            when {
                environment name: 'CHOICE', value: 'compile'
            }
            steps {
                echo 'for compile'
                sh 'mvn compile'
            }
        }
        stage('maven clean') {
            when {
                environment name: 'CHOICE', value: 'clean'
            }
            steps {
                echo 'for clean'
                sh 'mvn clean'
            }
        }
        stage('maven package') {
            when {
                environment name: 'CHOICE', value: 'package'
            }
            steps {
                echo 'for package'
                sh 'mvn package'
            }
        }
        stage('maven install') {
            when {
                environment name: 'CHOICE', value: 'install'
            }
            steps {
                echo 'for install'
                sh 'mvn install'
            }
        }
    }
}