pipeline {
    agent any

    stages {

        stage('Generate Cookie'){
          
            steps {
                        sh 'generate_cookie.sh'
                    }
                }
        stage('show available tenants'){
          
            steps {
                        sh 'show_tenants.sh'
                    }
                }

        stage('Add Tenant'){
          
            steps {
                        sh 'create_tenant.sh'
                    }
                }
        stage('Show Tenants (after-addition)'){
          
            steps {
                        sh 'show_tenants.sh'
                    }
                }
        stage('Delete Tenant'){
          
            steps {
                        sh 'delete_tenant.sh'
                    }
                }
        stage('Show Tenant (after-deletion)'){
          
            steps {
                        sh 'show_tenants.sh'
                    }
                }

          
    }
}
