# tap_bonds

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Jenkins CI/CD Automation

This section describes how to set up a CI/CD pipeline using Jenkins for this Flutter project. The pipeline is defined in the `Jenkinsfile` at the root of this repository.

### 1. Prerequisites for Jenkins Agent

Ensure the Jenkins agent (node or master) where the pipeline will run has the following software installed:

*   **Flutter SDK:**
    *   Install the Flutter SDK by following the official instructions: [Flutter SDK Installation](https://docs.flutter.dev/get-started/install).
    *   The Flutter SDK must be available in the Jenkins agent's `PATH`, or its location must be configured via the `FLUTTER_SDK` environment variable in Jenkins, or through Jenkins Global Tool Configuration.
*   **Java Development Kit (JDK):**
    *   Flutter development requires a JDK. Ensure a compatible version is installed.
*   **Android SDK:**
    *   Required for building Android applications. Install the Android SDK and ensure the necessary tools and platforms are available.
*   **(For iOS builds) macOS Agent:**
    *   To build iOS applications, the pipeline must run on a macOS agent.
    *   Xcode and CocoaPods must be installed on the macOS agent.

### 2. Jenkins Job Configuration

Follow these steps to create and configure the Jenkins pipeline job:

1.  In Jenkins, click on **"New Item"** from the dashboard.
2.  Enter a name for your job (e.g., "Flutter_App_CI_CD") and select **"Pipeline"**. Click **"OK"**.
3.  In the job configuration page, scroll down to the **"Pipeline"** section.
4.  For the **"Definition"** field, select **"Pipeline script from SCM"**.
5.  For **"SCM"**, choose **"Git"**.
6.  In **"Repositories"**:
    *   **Repository URL**: Enter the URL of this Git repository.
    *   You may need to add credentials if the repository is private.
7.  In **"Branches to build"**:
    *   **Branch Specifier**: Set to `*/main` or your primary development branch.
8.  For **"Script Path"**, enter `Jenkinsfile`. This tells Jenkins to use the `Jenkinsfile` from the root of the repository.
9.  Save the job configuration.

### 3. `FLUTTER_SDK` Configuration

The `Jenkinsfile` is designed to locate the Flutter SDK in one of several ways:

*   **Jenkins Global Tool Configuration (Recommended):**
    1.  Go to **"Manage Jenkins"** -> **"Global Tool Configuration"**.
    2.  Under the "Flutter" section (or add one if it doesn't exist), click **"Add Flutter"**.
    3.  **Name**: Enter `Flutter` (this name must match `tool name: 'Flutter'` in the `Jenkinsfile`).
    4.  **Flutter SDK Root**: Provide the absolute path to the Flutter SDK installation directory on the agent(s).
    5.  Save the configuration.
    The `Jenkinsfile` uses `tool name: 'Flutter', type: 'flutterSDK'` to try and find this configuration.

*   **`FLUTTER_SDK` Environment Variable:**
    *   You can define an environment variable named `FLUTTER_SDK` for the Jenkins agent or within the Jenkins job configuration itself.
    *   **Agent Level**: Configure this in the agent's settings (e.g., in the "Node Properties" section, add an environment variable `FLUTTER_SDK` with the path to your Flutter SDK).
    *   **Job Level**: In the Jenkins job configuration, under "General", check "This project is parameterized", add a "String Parameter" named `FLUTTER_SDK`, and set its default value to the path of your Flutter SDK.
    *   If `FLUTTER_SDK` is set, the pipeline will use this path.

*   **System PATH:**
    *   If neither of the above is configured, the pipeline will attempt to use `flutter` assuming it's already in the system's `PATH`.

### 4. iOS Build Notes

*   **macOS Environment Required:** iOS builds can only be performed on Jenkins agents running macOS with Xcode installed. The pipeline includes a condition to only run the iOS stage on macOS agents (`uname -s' == 'Darwin'`).
*   **Code Signing:** The current pipeline builds an unsigned iOS app using `flutter build ios --no-codesign`. This is suitable for testing on simulators or for development builds. For distribution to the App Store or TestFlight, you will need to configure code signing within your Xcode project and potentially modify the Jenkins pipeline to handle certificates and provisioning profiles.

### 5. Running the Pipeline

Once the job is configured, you can trigger the pipeline in several ways:

*   **Manually:** Open the Jenkins job and click **"Build Now"**.
*   **SCM Polling:** Configure the job to periodically poll the Git repository for changes.
*   **Webhooks:** For more immediate builds, configure webhooks in your Git repository provider (e.g., GitHub, GitLab) to notify Jenkins upon new commits.

The pipeline will then execute the stages defined in the `Jenkinsfile`: Checkout, Install Dependencies, Run Tests, Build Android APK, and conditionally Build iOS.
During the 'Run Tests' stage, tests are executed with the `--coverage` flag, and the resulting `coverage/lcov.info` file is archived as a build artifact. This report provides insights into code test coverage.
Check the "Console Output" for detailed logs of the build process and the "Artifacts" section for the coverage report.
