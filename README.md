# EmptyApp — ADI Ownership Verification APK

Minimal Android project for [private key ownership verification](https://support.google.com/googleplay/android-developer/answer/16761053#verifying_private_key_ownership_existing_packages_only) of an existing Play Console package.

Structure mirrors the Google sample: <https://github.com/android/security-samples/tree/main/AndroidDeveloperVerificationAPKSigningExample>.

## Build

Builds run on Azure Pipelines inside an Android build container (`mingc/android-build-box`). See [`azure-pipelines.yml`](azure-pipelines.yml). Trigger manually from Azure DevOps; the APK is published as the `signing-apk` artifact.

## Required Azure Pipelines configuration

Variable group **`adi-verification`** (linked to Azure Key Vault or stored as secret variables):

| Variable | Purpose |
|---|---|
| `ADI_REGISTRATION_SNIPPET` | Snippet from Play Console, written to `app/src/main/assets/adi-registration.properties` |
| `STORE_PASSWORD` | Keystore password |
| `KEY_ALIAS` | Key alias |
| `KEY_PASSWORD` | Key password |

Secure file **`release.keystore`**: the release keystore (the key being verified), uploaded under Pipelines → Library → Secure files.

## Package name

Set `namespace` / `applicationId` in `app/build.gradle.kts` to match the Play Console package you are verifying.
