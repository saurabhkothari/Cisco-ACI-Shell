pipeline {
    agent any

    stages {
        
        stage('Git'){
         
            steps{
            git branch: 'main', url: 'https://github.com/saurabhkothari/Cisco-ACI-Shell.git'
            }
        }

        stage('Generate Cookie'){
          dir("${env.WORKSPACE}"){
            steps {
                        sh 'bash generate_cookie.sh'
                    }
                }
        }
        stage('show available tenants'){
          dir("${env.WORKSPACE}"){
            steps {
                        sh 'bash show_tenants.sh'
                    }
                }
        }

        stage('Add Tenant'){
          
            steps {
                        sh 'bash create_tenant.sh'
                    }
                }
        stage('Show Tenants (after-addition)'){
          
            steps {
                        sh 'bash show_tenants.sh'
                    }
                }
        stage('Delete Tenant'){
          
            steps {
                        sh 'bash delete_tenant.sh'
                    }
                }
        stage('Show Tenant (after-deletion)'){
          
            steps {
                        sh 'bash show_tenants.sh'
                    }
                }

          
    }
}
