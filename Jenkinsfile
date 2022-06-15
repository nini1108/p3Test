pipeline {
    agent any

    environment {
        //ENVIRONMENT = 'uat'
        //BRANCH_UAT = 'master'
        //S3_CREDENTIAL = 'S3'
        //S3_REGION = 'ap-southeast-2'
        BUCKET_NAME = 's3://p3test2'
        //GCS_BUCKET_NAME = 'gs://gcp.uat.goexperts.net'
        //GCS_CREDENTIAL = 'goexpert-gcs'
        WORKSPACE_PATH = '/var/lib/jenkins/workspace/p3Test/build' 
    }

    stages {
        stage('Git checkout') {
            steps {
                // Get source code from Austin's Repo
                git branch:'main', url:'https://github.com/nini1108/p3Test.git'
            }
        }

        // stage('npm install') {
        //     steps { 
        //         dir("./front_end/") {
        //             sh 'npm install'
        //         }
                
        //     }
        // }

        // stage('npm build') {
        //     steps {
        //         dir("./front_end/") {
        //             sh 'npm run build'
        //             sh 'exit 1'
        //         }
        //     }
        // }


        stage('Create S3 Bucket ...') {
            // when {
            //    expression { currentBuild.result == null || currentBuild.result == 'SUCCESS' }
            //}
            steps {
                    sh 'aws s3 mb ${BUCKET_NAME} --region ap-southeast-2'
                    //sh 'aws s3api put-bucket-policy --bucket ${BUCKET_NAME} --policy file://policy.json'
                    sh 'aws s3 cp /var/lib/jenkins/workspace/p3Test/front_end/build/ s3://${BUCKET_NAME}/ --recursive'
            }
        } 
    }
}


// def deployToS3(environment) {
//     echo 'Deploying to ' + environment + ' ...'
//     //withAWS(credentials: S3_CREDENTIAL, region: S3_REGION) {
//         // Empty the UAT bucket
//         sh 'aws s3 rm "${BUCKET_NAME}" --recursive' // ${BUCKET_NAME} is also fine
//         // Copy the static files from workspace to the S3 bucket
//         sh 'aws s3 cp "${WORKSPACE_PATH}" "${BUCKET_NAME}" --recursive --acl public-read'
//     //}
// }