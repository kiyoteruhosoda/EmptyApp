# EmptyApp — ADI Ownership Verification APK

Minimal Android project for [private key ownership verification](https://support.google.com/googleplay/android-developer/answer/16761053#verifying_private_key_ownership_existing_packages_only) of an existing Play Console package.

Structure mirrors the Google sample: <https://github.com/android/security-samples/tree/main/AndroidDeveloperVerificationAPKSigningExample>.

## Build

Trigger the `Build Signing APK` workflow manually (`workflow_dispatch`). The workflow spins up a self-hosted GitHub Actions runner on Azure Container Instances via an Azure Function, runs `gradle assembleRelease` on it, publishes the APK as the `signing-apk` artifact, and stops the ACI.

The runner must register with labels `self-hosted, android` and have Android SDK + Gradle available on `PATH`.

## Required GitHub secrets

| Secret | Purpose |
|---|---|
| `FUNC_URL` | Azure Function endpoint that starts the ACI runner |
| `FUNC_STOP_URL` | Azure Function endpoint that stops the ACI runner |
| `FUNC_STATUS_URL` | Azure Function endpoint that returns ACI status + logs |
| `ADI_REGISTRATION_SNIPPET` | Snippet from Play Console, written to `app/src/main/assets/adi-registration.properties` |
| `KEYSTORE_BASE64` | Base64-encoded release keystore (the key being verified) |
| `KEY_ALIAS` | Key alias |
| `KEY_PASSWORD` | Key password |
| `STORE_PASSWORD` | Keystore password |

## Package name

Set `namespace` / `applicationId` in `app/build.gradle.kts` to match the Play Console package you are verifying.
