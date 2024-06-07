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

### CheckApiBreakagePlugin

This plugin runs a script to check for any breaking changes in the API. It uses the swift package diagnose-api-breaking-changes command to analyze the current API against the last tagged version and reports any breaking changes found.

Usage: `swift package check-api-breakage --disable-sandbox`
	
### CheckBrokenSymlinksPlugin
This plugin runs a script to find and report broken symbolic links within the repository. It iterates over all files tracked by Git and checks if their symlink targets exist.

Usage: `swift package check-broken-symlinks --disable-sandbox`

### CheckLocalSwiftDependenciesPlugin
This plugin checks for local Swift package dependencies in the repository. It scans Package.swift files for local dependencies defined using .package(path:) and reports any occurrences.

Usage: `swift package check-local-swift-dependencies --disable-sandbox`
	
### CheckOpenApiSecurityPlugin
This plugin runs a security analysis on the OpenAPI specification using OWASP ZAP. It runs the zap-api-scan.py script inside a Docker container to check for security vulnerabilities in the OpenAPI definition.

Usage: `swift package check-openapi-security --disable-sandbox`

### CheckOpenApiValidationPlugin
This plugin validates the OpenAPI specification for compliance with the OpenAPI standard. It uses the openapi-spec-validator tool inside a Docker container to perform the validation.

Usage: `swift package check-openapi-validation --disable-sandbox`

### CheckUnacceptableLanguagePlugin
This plugin checks the codebase for unacceptable language patterns. It uses a predefined list of unacceptable terms and searches the codebase for any matches, reporting them if found.

Usage: `swift package check-unacceptable-language --disable-sandbox`

### GenerateContributorsListPlugin
This plugin generates a list of contributors for the repository. It uses the git shortlog command to gather commit information and formats it into a CONTRIBUTORS.txt file.

Usage: `swift package generate-contributors-list --disable-sandbox`

### InstallSwiftFormatPlugin
This plugin installs the swift-format tool.

Usage: `swift package install-swift-format --disable-sandbox`

### InstallSwiftOpenApiGeneratorPlugin
This plugin installs the Swift OpenAPI generator tool.

Usage: `swift package install-swift-openapi-generator --disable-sandbox`
	
### RunCleanPlugin
This plugin cleans up build artifacts and other temporary files from the repository. 

Usage: `swift package run-clean --disable-sandbox`

### 	RunOpenApiServerPlugin
This plugin serves the OpenAPI documentation using an Nginx server.

Usage: `swift package run-openapi-server --disable-sandbox`

### RunSwiftFormatPlugin
This plugin formats Swift code using the swift-format tool. It runs the tool on all Swift files in the repository, optionally fixing some of the issues if the --fix argument is provided.

Usage: `swift package run-swift-format --disable-sandbox` or `swift package run-swift-format --fix --disable-sandbox` for fixing


