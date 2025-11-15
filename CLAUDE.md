# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build Commands

### Building the Package
```bash
swift build
```

### Opening in Xcode
```bash
open Package.swift
```

### Linting
```bash
make lint
```
This runs SwiftLint with auto-fix enabled. SwiftLint binary is located in `tools/swiftlint/`.

### Installing/Updating SwiftLint
```bash
make swiftlint
```
Downloads SwiftLint 0.50.3 and verifies SHA256 checksum.

## Architecture Overview

### Design Token System

The design system uses a **token-based architecture** for consistency:

1. **Public Tokens** (`Sources/DesignSystem/Tokens/`)
   - `Spacings.swift` - Spacing scale from 2pt to 72pt (`.spacing25` through `.spacing900`)
   - `Radiuses.swift` - Border radius scale from 2pt to 24pt (`.radius25` through `.radius300`)
   - `BorderWidth.swift` - Border width values (`.borderWidthPrimary`, `.borderWidthSecondary`)
   - `Opacity.swift` - Interaction state opacity (`.pressedOpacity`)
   - `Animations.swift` - Standard animations (`.bouncyDefault`)

2. **Token Usage Rules**
   - **Always use tokens** in theme default values and component layouts
   - **Public extensions** in token files for values used as public initializer defaults
   - **Public extensions** in theme files for theme-specific constants (e.g., `textEditorMinHeight` in `BorderedTextEditorTheme`)
   - **Private extensions** in component files (above `#Preview`) for component-internal values only

### Theme System

**Environment-based theming** using SwiftUI's `@Observable` macro and `@Entry` property wrapper:

1. **Theme Structure**
   - Each themeable component has a corresponding `XxxTheme` class
   - Themes are `@Observable` classes with `let` properties
   - Environment values use `@Entry` for automatic key creation
   - Example: `BorderedTextFieldTheme`, `ButtonTheme`, `SliderPickerTheme`

2. **Theme Location Pattern**
   - Themes live in `Sources/DesignSystem/Theme/{ComponentType}/`
   - File naming: `Environment+{ComponentName}Theme.swift`
   - Button themes have sub-configurations: `ButtonTheme+Primary.swift`, `ButtonTheme+Secondary.swift`, `ButtonTheme+Tertiary.swift`

3. **Applying Themes**
   ```swift
   ComponentView()
       .environment(\.componentTheme, customTheme)
   ```

### Component Architecture

1. **Component Structure**
   - Location: `Sources/DesignSystem/Components/{ComponentName}/`
   - Each component file contains the component + private extensions + `#Preview`
   - Components read theme from environment: `@Environment(\.componentTheme) private var theme`

2. **Validation Pattern**
   - Components that need validation accept `validationError: Binding<String?>`
   - Use `ValidationState<T>` helper for state management
   - Apply validation with `.validate()` modifier from `View+Validation.swift`
   - Error display is automatic when `validationError` is not nil

3. **Key Components**
   - **BorderedTextField** - Single-line text input with validation, clear button, focus states
   - **BorderedTextEditor** - Multiline text editor with validation, placeholder, min/max height
   - **SliderPicker** - Gesture-based slider with step selection
   - **FlexibleStack** - Custom Layout that wraps content into rows (uses Layout protocol)

### Style System

**ButtonStyle, LabelStyle, GroupBoxStyle** implementations in `Sources/DesignSystem/Styles/`:

- Button styles (Primary, Secondary, Tertiary) read from `ButtonTheme` environment
- Use `.buttonStyle(.primary)`, `.buttonStyle(.secondary)`, `.buttonStyle(.tertiary)`
- Styles handle disabled states, pressed states, and accessibility

### Extension Organization

1. **View Extensions** (`Extensions/View+Extensions.swift`)
   - `.container()` - Applies background, padding, and corner radius
   - `.shadow100()`, `.shadow200()`, `.shadow300()` - Predefined shadow styles

2. **Alignment Extensions** (`Components/FlexibleStack/`)
   - Convert between SwiftUI alignment types for FlexibleStack layout calculations

## Code Conventions

### When Adding New Components

1. **Create component file** in `Sources/DesignSystem/Components/{ComponentName}/`
2. **Create theme file** in `Sources/DesignSystem/Theme/{ComponentName}/Environment+{ComponentName}Theme.swift`
3. **Use design tokens** for all spacing, radius, and standard values
4. **Add `#Preview`** at bottom with `#if DEBUG` guard
5. **Document with DocC comments** including usage examples

### When Adding New Tokens

- **Only create public tokens** for values used as defaults in public initializers
- **Use existing spacing/radius tokens** whenever possible before creating new ones
- **Add descriptive comments** with actual values (e.g., `/// Value: 2.0`)

### Theme Default Values

- All theme properties should use tokens or semantic constants
- Example: `borderWidth: CGFloat = .borderWidthPrimary` not `borderWidth: CGFloat = 2`

### Platform Requirements

- **Minimum iOS version**: 17.0
- **Swift version**: 6.1
- Uses SwiftUI's `@Observable` (iOS 17+), `@Entry` (iOS 17+), Layout protocol

## Testing

Tests are located in `Tests/DesignSystemTests/`. The package uses standard Swift Package Manager testing.

```bash
swift test
```
