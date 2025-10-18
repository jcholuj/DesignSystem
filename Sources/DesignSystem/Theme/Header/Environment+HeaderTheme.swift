import SwiftUI

public extension EnvironmentValues {
  @Entry var headerTheme: HeaderTheme = .init()
}

@Observable
public final class HeaderTheme {
  public enum HeaderAlignment {
    case leading
    case center
    case trailing

    var horiznotalAlignment: HorizontalAlignment {
      switch self {
      case .leading:
          .leading
      case .center:
          .center
      case .trailing:
          .trailing
      }
    }

    var alignment: Alignment {
      switch self {
      case .leading:
          .leading
      case .center:
          .center
      case .trailing:
          .trailing
      }
    }
  }

  let font: Font
  let headerTextColor: Color
  let spacing: CGFloat
  let headerAlignment: HeaderAlignment
  let maxWidth: CGFloat?

  public init(
    font: Font = .headline.weight(.semibold),
    headerTextColor: Color = .black,
    spacing: CGFloat = .spacing100,
    headerAlignment: HeaderAlignment = .leading,
    maxWidth: CGFloat? = .infinity
  ) {
    self.font = font
    self.headerTextColor = headerTextColor
    self.spacing = spacing
    self.headerAlignment = headerAlignment
    self.maxWidth = maxWidth
  }
}
