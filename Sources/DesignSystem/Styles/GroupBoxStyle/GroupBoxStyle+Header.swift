import SwiftUI

public extension GroupBoxStyle where Self == HeaderGroupBoxStyle {
  /// A group box style with header-focused styling.
  ///
  /// Use this style for content sections with prominent headers.
  static var header: Self { .init() }
}

/// A group box style that emphasizes the header label.
///
/// `HeaderGroupBoxStyle` arranges content with a prominent header and customizable
/// alignment and spacing, all controlled through the `HeaderTheme` environment.
///
/// ## Basic Usage
///
/// ```swift
/// GroupBox("Section Title") {
///     Text("Content goes here")
/// }
/// .groupBoxStyle(.header)
/// ```
///
/// ## Customizing with Theme
///
/// ```swift
/// let customTheme = HeaderTheme(
///     font: .title2.bold(),
///     headerTextColor: .purple,
///     spacing: .spacing200,
///     headerAlignment: .center
/// )
///
/// GroupBox("Title") {
///     VStack {
///         Text("Line 1")
///         Text("Line 2")
///     }
/// }
/// .groupBoxStyle(.header)
/// .environment(\.headerTheme, customTheme)
/// ```
///
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
