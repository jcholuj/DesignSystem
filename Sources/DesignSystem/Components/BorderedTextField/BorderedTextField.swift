import SwiftUI

/// A customizable text field component with border styling, validation support, and an optional clear button.
///
/// `BorderedTextField` provides a polished text input experience with:
/// - Animated border that highlights on focus
/// - Built-in validation error display
/// - Optional clear button
/// - Fully customizable appearance through `BorderedTextFieldTheme`
///
/// ## Basic Usage
///
/// ```swift
/// struct ContentView: View {
///     @State private var text = ""
///
///     var body: some View {
///         BorderedTextField(
///             text: $text,
///             prompt: "Enter your name"
///         )
///     }
/// }
/// ```
///
/// ## With Validation
///
/// ```swift
/// struct ContentView: View {
///     @State private var username = ValidationState(
///         value: "",
///         validator: { value in
///             value.count >= 3 ? nil : "Username must be at least 3 characters"
///         }
///     )
///
///     var body: some View {
///         BorderedTextField(
///             text: $username.value,
///             validationError: $username.errorMessage,
///             prompt: "Username"
///         )
///         .validate(username) { username.errorMessage = $0 }
///     }
/// }
/// ```
///
/// ## Customizing Theme
///
/// ```swift
/// let customTheme = BorderedTextFieldTheme(
///     color: .green,
///     backgroundColor: .white,
///     validationColor: .red
/// )
///
/// BorderedTextField(text: $text, prompt: "Username")
///     .environment(\.borderedTextFieldTheme, customTheme)
/// ```
///
/// - Note: Validation errors are displayed automatically below the input field when `validationError` binding is not nil and passed as a parameter.
///
public struct BorderedTextField: View {
  private let prompt: String?
  @Binding private var text: String
  @Binding private var validationError: String?
  @FocusState private var isFocused: Bool
  @Environment(\.borderedTextFieldTheme) private var theme

  /// Creates a bordered text field with optional validation and prompt.
  ///
  /// - Parameters:
  ///   - text: A binding to the text value of the text field.
  ///   - validationError: A binding to an optional validation error message. When not nil, displays an error label below the text field.
  ///   - prompt: Optional placeholder text displayed when the field is empty.
  public init(
    text: Binding<String>,
    validationError: Binding<String?> = .constant(nil),
    prompt: String? = nil
  ) {
    _text = text
    _validationError = validationError
    self.prompt = prompt
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: .spacing100) {
      HStack(spacing: .spacing200) {
        Group {
          if let prompt {
            TextField("", text: $text, prompt: Text(prompt))
          } else {
            TextField("", text: $text)
          }
        }
        .focused($isFocused)
        .foregroundStyle(
          self.isFocused
          ? theme.enabledTextColor
          : theme.textColor
        )
        .font(.headline.weight(.medium))
        .frame(maxWidth: .infinity)

        if let icon = theme.clearButtonIcon {
          Button(
            action: { self.text = "" },
            label: {
              icon
                .resizable()
                .frame(.spacing300)
            }
          )
          .foregroundStyle(theme.enabledTextColor)
        }
      }
      .padding(.spacing200)
      .frame(height: theme.height)
      .container(
        .zero,
        backgroundColor: theme.backgroundColor,
        cornerRadius: theme.cornerRadius
      )
      .overlay(
        RoundedRectangle(cornerRadius: theme.cornerRadius)
          .stroke(
            borderColor,
            lineWidth: theme.borderWidth
          )
          .shadow200()
      )

      if let validationError {
        Label(errorMessage: validationError)
          .labelStyle(.error(color: theme.validationColor))
      }
    }
  }
}

private extension BorderedTextField {
  var borderColor: Color {
    guard self.validationError == nil
    else { return theme.validationColor }
    return self.isFocused ? theme.color : .clear
  }
}

#if DEBUG
private enum Validator {
  static func isLettersOnly(_ value: String) -> String? {
    value.allSatisfy(\.isLetter)
    ? nil
    : "Value should contain only letters."
  }
}

#Preview {
  @Previewable @State var word: ValidationState = .init(value: "", validator: Validator.isLettersOnly)

  BorderedTextField(
    text: $word.value,
    validationError: $word.errorMessage
  )
    .validate(word) { word.errorMessage = $0 }
    .padding(.spacing200)
    .frame(maxHeight: .infinity)
    .background(Color.gray.opacity(0.25).ignoresSafeArea())
}
#endif
