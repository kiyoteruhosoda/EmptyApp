# EmptyApp — ADI Ownership Verification APK

Minimal Android project for [private key ownership verification](https://support.google.com/googleplay/android-developer/answer/16761053#verifying_private_key_ownership_existing_packages_only) of an existing Play Console package.

Structure mirrors the Google sample: <https://github.com/android/security-samples/tree/main/AndroidDeveloperVerificationAPKSigningExample>.

## Required GitHub secrets

| Secret | Purpose |
|---|---|
| `ADI_REGISTRATION_SNIPPET` | Snippet from Play Console, written to `app/src/main/assets/adi-registration.properties` |
| `KEYSTORE_BASE64` | Base64-encoded release keystore (the key being verified) |
| `KEY_ALIAS` | Key alias |
| `KEY_PASSWORD` | Key password |
| `STORE_PASSWORD` | Keystore password |

## Build

Run the `Build Signing APK` workflow (`workflow_dispatch`). The APK is uploaded as the `signing-apk` artifact.

## Package name

Set `namespace` / `applicationId` in `app/build.gradle.kts` to match the Play Console package you are verifying.
