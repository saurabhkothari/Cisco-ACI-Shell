pipeline {
    agent any

    stages {
        
        stage('Git'){
            steps{
            git branch: 'main', url: 'https://github.com/saurabhkothari/Cisco-ACI-Shell.git'
            }
        }

        stage('Generate Cookie'){
          
            steps {
                        sh './generate_cookie.sh'
                    }
                }
        stage('show available tenants'){
          
            steps {
                        sh './show_tenants.sh'
                    }
                }

        stage('Add Tenant'){
          
            steps {
                        sh './create_tenant.sh'
                    }
                }
        stage('Show Tenants (after-addition)'){
          
            steps {
                        sh './show_tenants.sh'
                    }
                }
        stage('Delete Tenant'){
          
            steps {
                        sh './delete_tenant.sh'
                    }
                }
        stage('Show Tenant (after-deletion)'){
          
            steps {
                        sh './show_tenants.sh'
                    }
                }

          
    }
}
