import SwiftUI

/// # Design System Color Tokens
///
/// This file defines all color tokens used throughout the design system.
/// Colors are organized into semantic palettes following the Atlassian Color Palette:
/// https://atlassian.design/foundations/color-new/color-palette-new
///
/// ## Color Palettes
///
/// **Chromatic Colors** (100-500 scale):
/// - Each chromatic color has 6 shades: 100, 200, 250, 300, 400, 500
/// - Lower numbers (100) are lighter, higher numbers (500) are darker
/// - Available palettes: lime, red, orange, yellow, green, teal, blue, purple, magenta
///
/// **Neutral Colors** (0-1100 scale):
/// - Neutral palette has 12 shades in 100-point increments
/// - Range: neutral0 (lightest) through neutral1100 (darkest)
/// - Used for backgrounds, borders, and typography
///
/// ## Light/Dark Mode Support
///
/// All colors automatically adapt to light and dark modes via asset catalog configurations.
/// Color values are defined in `Resources/Assets.xcassets` with appearance variants.
///
/// ## Usage
///
/// ```swift
/// Rectangle()
///   .fill(.lime300)
///   .border(.neutral500, width: .borderWidthPrimary)
/// ```

// MARK: - Lime

public extension Color {
  static let lime100 = Color("lime100", bundle: .module)
  static let lime200 = Color("lime200", bundle: .module)
  static let lime250 = Color("lime250", bundle: .module)
  static let lime300 = Color("lime300", bundle: .module)
  static let lime400 = Color("lime400", bundle: .module)
  static let lime500 = Color("lime500", bundle: .module)

  // MARK: - Red

  static let red100 = Color("red100", bundle: .module)
  static let red200 = Color("red200", bundle: .module)
  static let red250 = Color("red250", bundle: .module)
  static let red300 = Color("red300", bundle: .module)
  static let red400 = Color("red400", bundle: .module)
  static let red500 = Color("red500", bundle: .module)

  // MARK: - Orange

  static let orange100 = Color("orange100", bundle: .module)
  static let orange200 = Color("orange200", bundle: .module)
  static let orange250 = Color("orange250", bundle: .module)
  static let orange300 = Color("orange300", bundle: .module)
  static let orange400 = Color("orange400", bundle: .module)
  static let orange500 = Color("orange500", bundle: .module)

  // MARK: - Yellow

  static let yellow100 = Color("yellow100", bundle: .module)
  static let yellow200 = Color("yellow200", bundle: .module)
  static let yellow250 = Color("yellow250", bundle: .module)
  static let yellow300 = Color("yellow300", bundle: .module)
  static let yellow400 = Color("yellow400", bundle: .module)
  static let yellow500 = Color("yellow500", bundle: .module)

  // MARK: - Green

  static let green100 = Color("green100", bundle: .module)
  static let green200 = Color("green200", bundle: .module)
  static let green250 = Color("green250", bundle: .module)
  static let green300 = Color("green300", bundle: .module)
  static let green400 = Color("green400", bundle: .module)
  static let green500 = Color("green500", bundle: .module)

  // MARK: - Teal

  static let teal100 = Color("teal100", bundle: .module)
  static let teal200 = Color("teal200", bundle: .module)
  static let teal250 = Color("teal250", bundle: .module)
  static let teal300 = Color("teal300", bundle: .module)
  static let teal400 = Color("teal400", bundle: .module)
  static let teal500 = Color("teal500", bundle: .module)

  // MARK: - Blue

  static let blue100 = Color("blue100", bundle: .module)
  static let blue200 = Color("blue200", bundle: .module)
  static let blue250 = Color("blue250", bundle: .module)
  static let blue300 = Color("blue300", bundle: .module)
  static let blue400 = Color("blue400", bundle: .module)
  static let blue500 = Color("blue500", bundle: .module)

  // MARK: - Purple

  static let purple100 = Color("purple100", bundle: .module)
  static let purple200 = Color("purple200", bundle: .module)
  static let purple250 = Color("purple250", bundle: .module)
  static let purple300 = Color("purple300", bundle: .module)
  static let purple400 = Color("purple400", bundle: .module)
  static let purple500 = Color("purple500", bundle: .module)

  // MARK: - Magenta

  static let magenta100 = Color("magenta100", bundle: .module)
  static let magenta200 = Color("magenta200", bundle: .module)
  static let magenta250 = Color("magenta250", bundle: .module)
  static let magenta300 = Color("magenta300", bundle: .module)
  static let magenta400 = Color("magenta400", bundle: .module)
  static let magenta500 = Color("magenta500", bundle: .module)

  // MARK: - Neutral

  static let neutral0 = Color("neutral0", bundle: .module)
  static let neutral100 = Color("neutral100", bundle: .module)
  static let neutral200 = Color("neutral200", bundle: .module)
  static let neutral300 = Color("neutral300", bundle: .module)
  static let neutral400 = Color("neutral400", bundle: .module)
  static let neutral500 = Color("neutral500", bundle: .module)
  static let neutral600 = Color("neutral600", bundle: .module)
  static let neutral700 = Color("neutral700", bundle: .module)
  static let neutral800 = Color("neutral800", bundle: .module)
  static let neutral900 = Color("neutral900", bundle: .module)
  static let neutral1000 = Color("neutral1000", bundle: .module)
  static let neutral1100 = Color("neutral1100", bundle: .module)
}

#if DEBUG
#Preview {
  VStack(spacing: .spacing50) {
    HStack(spacing: .spacing50) {
      ForEach(
        [Color.lime100, .lime200, .lime250, .lime300, .lime400, .lime500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.red100, .red200, .red250, .red300, .red400, .red500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.orange100, .orange200, .orange250, .orange300, .orange400, .orange500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.yellow100, .yellow200, .yellow250, .yellow300, .yellow400, .yellow500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.green100, .green200, .green250, .green300, .green400, .green500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.teal100, .teal200, .teal250, .teal300, .teal400, .teal500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.blue100, .blue200, .blue250, .blue300, .blue400, .blue500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.purple100, .purple200, .purple250, .purple300, .purple400, .purple500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.magenta100, .magenta200, .magenta250, .magenta300, .magenta400, .magenta500],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }

    HStack(spacing: .spacing50) {
      ForEach(
        [Color.neutral0, .neutral100, .neutral200, .neutral300, .neutral400, .neutral500, .neutral600, .neutral700, .neutral800, .neutral900, .neutral1000, .neutral1100],
        id: \.self
      ) {
        Rectangle().fill($0)
      }
    }
  }
}
#endif
