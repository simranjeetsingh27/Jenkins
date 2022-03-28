pipeline {
     agent any
        stages {
            stage ('check OS') {
                    steps {
                        sh 'cat /etc/os-release | head -1 | awk -F \'"\' \'{print $2}\'>file'
            }
        }
            stage ('show OS') {
                    steps {
                        sh '''#!/bin/bash
                        OS=$(cat file)
                        if [ $OS == "Ubuntu" ]
                        then
                        apt list --installed > file.txt
                        else
                        rpm -qa
                        fi
                        '''
                    }
                }
                stage ('build artifacts') {
                        steps {
           archiveArtifacts artifacts: 'file.txt', followSymlinks: false
                    }
                }
            }
        }
