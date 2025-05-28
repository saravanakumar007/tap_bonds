pipeline {
    agent any

    environment {
        FLUTTER_SDK = '' // Configure this in Jenkins Global Tool Configuration or set a default path
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Ensure Flutter SDK is available
                    if (env.FLUTTER_SDK == null || env.FLUTTER_SDK.trim().isEmpty()) {
                        // Attempt to find flutter in PATH if not configured
                        def flutterExecutable = tool name: 'Flutter', type: 'flutterSDK' // Ensure 'Flutter' is the name of your Flutter SDK in Jenkins Global Tool Config
                        if (flutterExecutable) {
                            env.FLUTTER_HOME =flutterExecutable
                            env.PATH = "${flutterExecutable}/bin:${env.PATH}"
                        } else if (isUnix()) {
                            sh 'flutter --version' // Check if flutter is in global path
                        } else {
                            bat 'flutter --version' // Check if flutter is in global path for Windows
                        }
                    } else {
                         env.PATH = "${env.FLUTTER_SDK}/bin:${env.PATH}"
                    }
                    
                    // Print Flutter version for debugging
                    sh 'flutter --version'
                    sh 'flutter pub get'
                }
            }
        }

        stage('Run Tests') {
            steps {
                sh 'flutter test'
            }
        }

        stage('Build Android APK') {
            steps {
                sh 'flutter build apk --debug'
                archiveArtifacts artifacts: 'build/app/outputs/flutter-apk/app-debug.apk', fingerprint: true
            }
        }

        stage('Build iOS (Conditional)') {
            when {
                expression { isUnix() && sh(script: 'uname -s', returnStdout: true).trim() == 'Darwin' }
            }
            steps {
                sh 'flutter build ios --no-codesign'
                // Archiving iOS builds requires more setup (e.g., .app or .ipa)
                // For simplicity, this example doesn't archive iOS artifacts
                // archiveArtifacts artifacts: 'build/ios/iphoneos/Runner.app', fingerprint: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
