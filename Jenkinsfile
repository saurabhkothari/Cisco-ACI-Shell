pipeline {
    agent any

    stages {

        stage('Generate Cookie'){
          
            steps {
                        bash 'generate_cookie.sh'
                    }
                }
        stage('show available tenants'){
          
            steps {
                        bash 'show_tenants.sh'
                    }
                }

        stage('Add Tenant'){
          
            steps {
                        bash 'create_tenant.sh'
                    }
                }
        stage('Show Tenants (after-addition)'){
          
            steps {
                        bash 'show_tenants.sh'
                    }
                }
        stage('Delete Tenant'){
          
            steps {
                        bash 'delete_tenant.sh'
                    }
                }
        stage('Show Tenant (after-deletion)'){
          
            steps {
                        bash 'show_tenants.sh'
                    }
                }

          
    }
}
