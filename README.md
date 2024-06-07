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


| Plugin Name                        | Description                         | Usage                                         |
|------------------------------------|-------------------------------------|-----------------------------------------------|
| **CheckApiBreakagePlugin**         | Runs `check-api-breakage.sh`        | `swift package check-api-breakage --disable-sandbox`|
| **CheckBrokenSymlinksPlugin**      | Runs `check-broken-symlinks.sh`     | `swift package check-broken-symlinks --disable-sandbox`|
| **CheckLocalSwiftDependenciesPlugin** | Runs `check-local-swift-dependencies.sh` | `swift package check-local-swift-dependencies --disable-sandbox`|
| **CheckOpenApiSecurityPlugin**     | Runs `check-openapi-security.sh`    | `swift package check-openapi-security --disable-sandbox`|
| **CheckOpenApiValidationPlugin**   | Runs `check-openapi-validation.sh`  | `swift package check-openapi-validation --disable-sandbox`|
| **CheckUnacceptableLanguagePlugin**| Runs `check-unacceptable-language.sh` | `swift package check-unacceptable-language --disable-sandbox`|
| **GenerateContributorsListPlugin** | Runs `generate-contributors-list.sh` | `swift package generate-contributors-list --disable-sandbox`|
| **InstallSwiftFormatPlugin**       | Runs `install-swift-format.sh`      | `swift package install-swift-format --disable-sandbox`|
| **InstallSwiftOpenApiGeneratorPlugin** | Runs `install-swift-openapi-generator.sh` | `swift package install-swift-openapi-generator --disable-sandbox`|
| **RunCleanPlugin**                 | Runs `run-clean.sh`                 | `swift package run-clean --disable-sandbox`|
| **RunOpenApiServerPlugin**         | Runs `run-openapi-server.sh`        | `swift package run-openapi-server --disable-sandbox`|
| **RunSwiftFormatPlugin**           | Runs `run-swift-format.sh`          | `swift package run-swift-format --disable-sandbox`|
