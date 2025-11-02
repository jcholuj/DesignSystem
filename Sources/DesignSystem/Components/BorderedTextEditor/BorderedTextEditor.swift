import SwiftUI

/// A customizable multiline text editor component with border styling, validation support, and placeholder text.
///
/// `BorderedTextEditor` provides a polished multiline text input experience with:
/// - Animated border that highlights on focus
/// - Built-in validation error display
/// - Placeholder text support
/// - Fully customizable appearance through `BorderedTextEditorTheme`
///
/// ## Basic Usage
///
/// ```swift
/// struct ContentView: View {
///     @State private var text = ""
///
///     var body: some View {
///         BorderedTextEditor(
///             text: $text,
///             prompt: "Enter your description"
///         )
///     }
/// }
/// ```
///
/// ## With Validation
///
/// ```swift
/// struct ContentView: View {
///     @State private var description = ValidationState(
///         value: "",
///         validator: { value in
///             value.count >= 10 ? nil : "Description must be at least 10 characters"
///         }
///     )
///
///     var body: some View {
///         BorderedTextEditor(
///             text: $description.value,
///             validationError: $description.errorMessage,
///             prompt: "Description"
///         )
///         .validate(description) { description.errorMessage = $0 }
///     }
/// }
/// ```
///
/// ## Customizing Theme
///
/// ```swift
/// let customTheme = BorderedTextEditorTheme(
///     color: .green,
///     backgroundColor: .white,
///     validationColor: .red,
///     minHeight: 200
/// )
///
/// BorderedTextEditor(text: $text, prompt: "Description")
///     .environment(\.borderedTextEditorTheme, customTheme)
/// ```
///
/// - Note: Validation errors are displayed automatically below the editor when `validationError` binding is not nil and passed as a parameter.
///
public struct BorderedTextEditor: View {
  private let prompt: String?
  @Binding private var text: String
  @Binding private var validationError: String?
  @FocusState private var isFocused: Bool
  @Environment(\.borderedTextEditorTheme) private var theme

  /// Creates a bordered text editor with optional validation and prompt.
  ///
  /// - Parameters:
  ///   - text: A binding to the text value of the text editor.
  ///   - validationError: A binding to an optional validation error message. When not nil, displays an error label below the text editor.
  ///   - prompt: Optional placeholder text displayed when the editor is empty.
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
      ZStack(alignment: .topLeading) {
        // Placeholder text
        if text.isEmpty, let prompt {
          Text(prompt)
            .foregroundStyle(theme.textColor)
            .font(.headline.weight(.medium))
            .padding(.spacing200)
            .padding(.leading, .textEditorPlaceholderLeadingOffset)
            .padding(.top, .spacing100)
        }

        TextEditor(text: $text)
          .focused($isFocused)
          .foregroundStyle(
            self.isFocused
            ? theme.enabledTextColor
            : theme.textColor
          )
          .font(.headline.weight(.medium))
          .scrollContentBackground(.hidden)
          .padding(.spacing200)
      }
      .frame(minHeight: theme.minHeight, maxHeight: theme.maxHeight)
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

private extension BorderedTextEditor {
  var borderColor: Color {
    guard self.validationError == nil
    else { return theme.validationColor }
    return self.isFocused ? theme.color : .clear
  }
}

#if DEBUG
private enum Validator {
  static func minLength(_ value: String) -> String? {
    value.count >= 10
    ? nil
    : "Description must be at least 10 characters."
  }
}

private extension CGFloat {
  /// Padding offset for text editor placeholder alignment.
  static let textEditorPlaceholderLeadingOffset = 5.0
}

#Preview {
  @Previewable @State var description: ValidationState = .init(value: "", validator: Validator.minLength)

  BorderedTextEditor(
    text: $description.value,
    validationError: $description.errorMessage,
    prompt: "Enter your description"
  )
    .validate(description) { description.errorMessage = $0 }
    .padding(.spacing200)
    .background(Color.gray.opacity(0.25).ignoresSafeArea())
}
#endif
