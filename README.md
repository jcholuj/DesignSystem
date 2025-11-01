# DesignSystem

A modern, themeable SwiftUI design system library for iOS 17+ that provides reusable UI components with a consistent, customizable design language.

## Overview

DesignSystem is a Swift Package that offers a collection of beautifully crafted UI components designed for rapid iOS application development. Each component is fully customizable through SwiftUI's environment system, allowing you to easily adapt the design to match your brand identity.

## Features

- **Environment-based Theming**: Customize component appearance using SwiftUI's environment values
- **Pre-built Components**: Ready-to-use UI components with sensible defaults
- **Flexible Layouts**: Advanced layout containers for complex UI requirements
- **Validation Support**: Built-in validation for form components
- **iOS 17+**: Built with the latest SwiftUI features

## Requirements

- iOS 17.0+
- Swift 6.1+
- Xcode 16.0+

## Installation

### Swift Package Manager

Add DesignSystem to your project through Xcode:

1. File > Add Package Dependencies
2. Enter the repository URL
3. Select the version you want to use

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/DesignSystem.git", from: "1.0.0")
]
```

## Components

### BorderedTextField

A customizable text field with border styling, validation support, and optional clear button.

```swift
import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var text = ""
    @State private var errorMessage: String?

    var body: some View {
        BorderedTextField(
            text: $text,
            validationError: $errorMessage,
            prompt: "Enter your name"
        )
        .padding()
    }
}
```

**Customization:**

```swift
struct ContentView: View {
    @State private var text = ""

    let customTheme = BorderedTextFieldTheme(
        color: .green,
        backgroundColor: .white,
        validationColor: .red
    )

    var body: some View {
        BorderedTextField(text: $text, prompt: "Email")
            .environment(\.borderedTextFieldTheme, customTheme)
            .padding()
    }
}
```

### SliderPicker

An interactive slider-based picker component with visual feedback and customizable steps.

```swift
import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var selection: Int? = 5

    var body: some View {
        SliderPicker(
            selection: $selection,
            steps: 10
        )
        .padding()
    }
}
```

**Customization:**

```swift
struct ContentView: View {
    @State private var selection: Int? = 5

    let customTheme = SliderPickerTheme(
        color: .purple,
        height: 40,
        cornerRadius: 20
    )

    var body: some View {
        SliderPicker(selection: $selection, steps: 10)
            .environment(\.sliderPickerTheme, customTheme)
            .padding()
    }
}
```

### FlexibleStack

A custom layout container that automatically wraps content into multiple rows based on available space.

```swift
import SwiftUI
import DesignSystem

struct ContentView: View {
    var body: some View {
        FlexibleStack(alignment: .leading, spacing: 8) {
            ForEach(tags, id: \.self) { tag in
                TagView(text: tag)
            }
        }
    }
}
```

## Theming

All components support environment-based theming. Each component has a corresponding theme class that can be customized:

### Available Themes

- `BorderedTextFieldTheme`: Customize text fields
- `SliderPickerTheme`: Customize slider pickers
- `ButtonTheme`: Customize buttons (Primary, Secondary, Tertiary)
- `HeaderTheme`: Customize headers

### Example: Global Theme

```swift
import SwiftUI
import DesignSystem

@main
struct MyApp: App {
    let textFieldTheme = BorderedTextFieldTheme(
        color: .blue,
        backgroundColor: .white
    )

    let sliderTheme = SliderPickerTheme(
        color: .blue,
        height: 24
    )

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.borderedTextFieldTheme, textFieldTheme)
                .environment(\.sliderPickerTheme, sliderTheme)
        }
    }
}
```

## Validation

The `BorderedTextField` component includes built-in validation support:

```swift
import SwiftUI
import DesignSystem

struct ContentView: View {
    @State private var email = ValidationState(
        value: "",
        validator: { value in
            value.contains("@") ? nil : "Invalid email"
        }
    )

    var body: some View {
        BorderedTextField(
            text: $email.value,
            validationError: $email.errorMessage
        )
        .validate(email) { email.errorMessage = $0 }
    }
}
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

[Add your license here]

## Author

[Add your information here]
