# Repository Guidelines

## Project Structure & Module Organization

`Source/` contains the `YPImagePicker` library. Feature code is grouped under `Pages/`, `Filters/`, and `SelectionsGallery/`; shared configuration, models, and utilities live in `Configuration/`, `Models/`, and `Helpers/`. Localized strings, image catalogs, XIBs, and the privacy manifest are under `Source/Resources/`. `Example/` is the runnable UIKit sample app. Package distribution is defined by `Package.swift` and `YPImagePicker.podspec`; Xcode schemes live in `YPImagePicker.xcodeproj`. Documentation artwork belongs in `Images/`.

## Build, Test, and Development Commands

- `swift package resolve` resolves the exact Stevia and PryntTrimmerView dependencies declared for SwiftPM.
- `pod install` prepares the CocoaPods-backed example workspace; open `YPImagePicker.xcworkspace` afterward.
- `xcodebuild -project YPImagePicker.xcodeproj -scheme YPImagePicker -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build` builds the framework without requiring a specific simulator.
- `xcodebuild -project YPImagePicker.xcodeproj -scheme Example -sdk iphonesimulator -destination 'generic/platform=iOS Simulator' build` validates library integration in the sample app.
- `swiftlint --config .swiftlint.yml` checks the repository's configured Swift style rules.

The package and podspec currently target iOS 15 and Swift 5.5. Keep both manifests aligned when changing deployment or dependency requirements.

## Coding Style & Naming Conventions

Use four-space indentation and standard Swift API naming: `UpperCamelCase` for types, `lowerCamelCase` for methods and properties, and descriptive enum cases. Existing public types use the `YP` prefix (for example, `YPImagePickerConfiguration`); follow that convention for new public API. Organize files with `// MARK:` sections where useful, keep UIKit work on the main thread, and preserve existing access-control intent. Run SwiftLint before submitting; its disabled and excluded rules are authoritative.

## Testing Guidelines

There is currently no automated test target. For every change, build both shared schemes and manually exercise affected flows in `Example`: permissions, camera capture, library selection, multiple selection, filtering/cropping, and video trimming as applicable. New regression-prone logic should include an XCTest target and test files named `<TypeName>Tests.swift`, with methods such as `testExportFailureCompletesSelection()`.

## Commit & Pull Request Guidelines

Recent commits use short, imperative summaries such as `Fix picker freeze...` or `Add privacy manifest...`. Keep commits focused and explain observable behavior. Pull requests should include a concise problem/solution description, linked issue when available, installation path tested (SwiftPM or CocoaPods), device/iOS/Xcode details, and validation steps. Include screenshots or recordings for UI changes and update `README.md` when public behavior or configuration changes.
