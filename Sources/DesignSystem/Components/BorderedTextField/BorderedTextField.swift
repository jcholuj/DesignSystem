import SwiftUI

public struct BorderedTextField: View {
  private let prompt: String?
  @Binding private var text: String
  @Binding private var validationError: String?
  @FocusState private var isFocused: Bool
  @Environment(\.borderedTextFieldTheme) private var theme

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
      .frame(height: .spacing900)
      .container(
        .zero,
        backgroundColor: theme.backgroundColor
      )
      .overlay(
        RoundedRectangle(cornerRadius: .radius150)
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
