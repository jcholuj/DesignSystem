import SwiftUI

public extension GroupBoxStyle where Self == HeaderGroupBoxStyle {
  static var header: Self { .init() }
}
public struct HeaderGroupBoxStyle: GroupBoxStyle {
  @Environment(\.headerTheme) private var theme

  public func makeBody(configuration: Configuration) -> some View {
    VStack(
      alignment: theme.headerAlignment.horiznotalAlignment,
      spacing: theme.spacing
    ) {
      configuration.label
        .font(theme.font)
        .foregroundStyle(theme.headerTextColor)
        .frame(
          maxWidth: theme.maxWidth,
          alignment: theme.headerAlignment.alignment
        )

      configuration.content
        .frame(
          maxWidth: theme.maxWidth,
          alignment: theme.headerAlignment.alignment
        )
    }
  }
}

#if DEBUG
#Preview {
  VStack(spacing: .spacing800) {
    GroupBox("Title") {
      VStack(alignment: .leading, spacing: .spacing50) {
        Text("First paragraph")
        Text("Second paragraph")
        Text("Third paragraph")
      }
      .font(.footnote)
    }

    GroupBox("Large title") {
      VStack(alignment: .center, spacing: .spacing50) {
        Text("First paragraph")
        Text("Second paragraph")
        Text("Third paragraph")
      }
    }
    .environment(\.headerTheme, .customLarge)
  }
  .groupBoxStyle(.header)
  .padding(.spacing200)
}

private extension HeaderTheme {
  static var customLarge: Self {
    .init(
      font: .largeTitle.bold(),
      headerTextColor: .purple,
      spacing: .spacing150,
      headerAlignment: .center
    )
  }
}
#endif
