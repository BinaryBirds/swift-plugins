# Swift Plugins WIP

This repository contains a set of Swift plugins designed to streamline various tasks such as checking for API breakages, validating OpenAPI specifications, and formatting Swift code.

## Install

Add the repository as a dependency:

```swift
.package(url: "https://github.com/BinaryBirds/swift-plugins", from: "0.0.1"),
```

Update the packages and you are ready.

## Plugins

To list plugins call `swift package plugin --list`


| Plugin Name                        | Verb                       | Description                         | Usage                                         |
|------------------------------------|----------------------------|-------------------------------------|-----------------------------------------------|
| **CheckApiBreakagePlugin**         | `check-api-breakage`       | Runs `check-api-breakage.sh`        | `swift package check-api-breakage --disable-sandbox`            |
| **CheckBrokenSymlinksPlugin**      | `check-broken-symlinks`    | Runs `check-broken-symlinks.sh`     | `swift package check-broken-symlinks --disable-sandbox`         |
| **CheckLocalSwiftDependenciesPlugin** | `check-local-swift-dependencies` | Runs `check-local-swift-dependencies.sh` | `swift package check-local-swift-dependencies --disable-sandbox` |
| **CheckOpenApiSecurityPlugin**     | `check-openapi-security`   | Runs `check-openapi-security.sh`    | `swift package check-openapi-security --disable-sandbox`        |
| **CheckOpenApiValidationPlugin**   | `check-openapi-validation` | Runs `check-openapi-validation.sh`  | `swift package check-openapi-validation --disable-sandbox`      |
| **CheckUnacceptableLanguagePlugin**| `check-unacceptable-language` | Runs `check-unacceptable-language.sh` | `swift package check-unacceptable-language --disable-sandbox`   |
| **GenerateContributorsListPlugin** | `generate-contributors-list` | Runs `generate-contributors-list.sh` | `swift package generate-contributors-list --disable-sandbox`    |
| **InstallSwiftFormatPlugin**       | `install-swift-format`     | Runs `install-swift-format.sh`      | `swift package install-swift-format --disable-sandbox`          |
| **InstallSwiftOpenApiGeneratorPlugin** | `install-swift-openapi-generator` | Runs `install-swift-openapi-generator.sh` | `swift package install-swift-openapi-generator --disable-sandbox` |
| **RunCleanPlugin**                 | `run-clean`                | Runs `run-clean.sh`                 | `swift package run-clean --disable-sandbox`                     |
| **RunOpenApiServerPlugin**         | `run-openapi-server`       | Runs `run-openapi-server.sh`        | `swift package run-openapi-server --disable-sandbox`            |
| **RunSwiftFormatPlugin**           | `run-swift-format`         | Runs `run-swift-format.sh`          | `swift package run-swift-format --disable-sandbox`              |
