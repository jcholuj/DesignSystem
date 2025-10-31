import SwiftUI

public extension Label where Title == Text, Icon == Image {
  init(errorMessage: String) {
    self.init(
      title: { Text(errorMessage) },
      icon: { Image(systemName: "exclamationmark.circle") }
    )
  }
}

public extension LabelStyle where Self == ErrorLabelStyle {
  static var error: Self { .init() }

  static func error(color: Color) -> Self {
    .init(color: color)
  }
}
public struct ErrorLabelStyle: LabelStyle {
  private let color: Color

  public init(color: Color = .red) {
    self.color = color
  }

  public func makeBody(configuration: Configuration) -> some View {
    HStack(spacing: .spacing75) {
      configuration.icon

      configuration.title
    }
    .foregroundStyle(Color.red)
    .font(.footnote.weight(.semibold))
  }
}

#if DEBUG
#Preview {
  Label(errorMessage: "Something went wrong.")
    .labelStyle(.error)
}
#endif
