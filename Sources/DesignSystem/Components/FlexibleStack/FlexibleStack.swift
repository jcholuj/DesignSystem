import SwiftUI

/// A custom layout container that automatically wraps content into multiple rows based on available space.
///
/// `FlexibleStack` arranges its subviews horizontally, wrapping them to the next row when they don't fit in the available width.
/// This is similar to CSS flexbox with `flex-wrap: wrap` behavior.
///
/// Features:
/// - Automatic row wrapping based on available width
/// - Customizable alignment for content positioning
/// - Optional spacing between items
/// - Ideal for tag clouds, chip collections, or any dynamic content layout
///
/// ## Basic Usage
///
/// ```swift
/// struct ContentView: View {
///     let tags = ["SwiftUI", "iOS", "Design", "Layout", "Components"]
///
///     var body: some View {
///         FlexibleStack(alignment: .leading, spacing: .spacing100) {
///             ForEach(tags, id: \.self) { tag in
///                 Text(tag)
///                     .padding(.horizontal, .spacing150)
///                     .padding(.vertical, .spacing75)
///                     .background(Color.blue.opacity(0.2))
///                     .cornerRadius(.radius100)
///             }
///         }
///     }
/// }
/// ```
///
/// ## With Different Alignments
///
/// ```swift
/// // Center aligned
/// FlexibleStack(alignment: .center, spacing: 8) {
///     ForEach(items, id: \.self) { item in
///         ItemView(item: item)
///     }
/// }
///
/// // Trailing aligned
/// FlexibleStack(alignment: .trailing, spacing: 12) {
///     ForEach(items, id: \.self) { item in
///         ItemView(item: item)
///     }
/// }
/// ```
///
/// - Note: FlexibleStack uses SwiftUI's Layout protocol and calculates row wrapping dynamically based on available space.
///
public struct FlexibleStack: Layout {
  private let alignment: Alignment
  private let spacing: CGFloat?

  /// Creates a flexible stack layout with specified alignment and spacing.
  ///
  /// - Parameters:
  ///   - alignment: The alignment of items within each row and rows within the container (default is `.center`).
  ///   - spacing: Optional spacing between items. If nil, uses default SwiftUI spacing.
  public init(
    alignment: Alignment = .center,
    spacing: CGFloat? = nil
  ) {
    self.alignment = alignment
    self.spacing = spacing
  }

  public func sizeThatFits(
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Void
  ) -> CGSize {
    let layout = FlexibleLayout(
      proposal: proposal,
      subviews: subviews,
      spacing: spacing
    )
    return .init(
      width: self.makeWidth(
        proposal: proposal,
        layout: layout
      ),
      height: self.makeHeight(
        proposal: proposal,
        layout: layout
      )
    )
  }

  public func placeSubviews(
    in bounds: CGRect,
    proposal: ProposedViewSize,
    subviews: Subviews,
    cache: inout Void
  ) {
    self.placeSubviews(
      in: bounds,
      using: FlexibleLayout(
        proposal: proposal,
        subviews: subviews,
        spacing: self.spacing
      ),
      subviews: subviews
    )
  }

  private func placeSubviews(
    in bounds: CGRect,
    using layout: FlexibleLayout,
    subviews: Subviews
  ) {
    for row in layout.rows {
      let verticalPercentage = self.alignment.vertical.percentage
      let horizontalPercentage = self.alignment.horizontal.percentage
      let rowXOffset = (bounds.width - row.frame.width) * horizontalPercentage
      for item in row.items {
        let xPosition = rowXOffset + row.frame.minX + item.xOffset + bounds.minX
        let itemHeight = subviews[item.index].sizeThatFits(.unspecified).height
        let rowYAlignment = (row.frame.height - itemHeight) * verticalPercentage
        let yPosition = row.frame.minY + rowYAlignment + bounds.minY

        subviews[item.index].place(
          at: .init(
            x: xPosition,
            y: yPosition
          ),
          anchor: .topLeading,
          proposal: .unspecified
        )
      }
    }
  }

  private func makeWidth(
    proposal: ProposedViewSize,
    layout: FlexibleLayout
  ) -> CGFloat {
    let maxWidth = proposal.replacingUnspecifiedDimensions().width
    let maxRowWidth = layout.rows
      .map(\.frame.width)
      .max() ?? maxWidth
    return maxRowWidth > maxWidth ? maxWidth : maxRowWidth
  }

  private func makeHeight(
    proposal: ProposedViewSize,
    layout: FlexibleLayout
  ) -> CGFloat {
    let defaultSpacing = ViewSpacing().distance(to: ViewSpacing(), along: .vertical)
    let verticalSubviewsSpacing = self.spacing ?? defaultSpacing
    let rowsHeight = layout.rows
      .map(\.frame.height)
      .reduce(0, +)
    return CGFloat(max(layout.rows.count, 1) - 1) * verticalSubviewsSpacing + rowsHeight
  }
}
