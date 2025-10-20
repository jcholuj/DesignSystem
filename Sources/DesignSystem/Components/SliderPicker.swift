import SwiftUI

public struct SliderPicker: View {
  private let steps: Int
  @State private var width: CGFloat = .zero
  @Binding private var selection: Int?
  @Binding private var isScrolling: Bool
  @Namespace private var pickerSpace
  @Environment(\.sliderPickerTheme) private var theme

  private var values: [Int] {
    Array(0...steps)
  }

  private var spacing: CGFloat {
    (width - CGFloat(steps)) / CGFloat(steps)
  }

  private var selectedValueWidth: CGFloat {
    guard let selection
    else { return .zero }
    return CGFloat(selection) * (spacing + 1)
  }

  public init(
    selection: Binding<Int?>,
    isScrolling: Binding<Bool> = .constant(false),
    steps: Int = 10
  ) {
    self._selection = selection
    self._isScrolling = isScrolling

    guard
      let wrappedSelection = selection.wrappedValue,
      wrappedSelection > steps
    else {
      self.steps = steps
      return
    }

    fatalError("Selection cannot be higher than steps count")
  }

  public var body: some View {
    ZStack(alignment: .topLeading) {
      pickerBackground

      pickerSelection

      HStack(spacing: self.spacing) {
        ForEach(self.values, id: \.self) { value in
          VStack(spacing: 8) {
            divider(for: value)

            Spacer()
          }
          .overlay(alignment: self.getAlignment(for: value)) {
            label(for: value)
          }
        }
      }
      .background(.clear)
      .frame(height: self.theme.height + 28.0)
    }
    .frame(maxWidth: .infinity)
    .coordinateSpace(name: self.pickerSpace)
    .gesture(
      SpatialTapGesture(
        count: 1,
        coordinateSpace: .named(self.pickerSpace)
      )
      .onEnded { self.updateSelectedValue(for: $0.location) }
    )
    .gesture(
      DragGesture(
        minimumDistance: 20,
        coordinateSpace: .named(pickerSpace)
      )
      .onChanged { self.updateSelectedValue(for: $0.location) }
    )
    .animation(
      self.theme.animation,
      value: self.selectedValueWidth
    )
    .background(
      GeometryReader { geometry in
        Color.clear
          .task { self.width = geometry.frame(in: .named(pickerSpace)).size.width }
      }
    )
  }
}

// MARK: ViewBuilders

private extension SliderPicker {
  @ViewBuilder
  var pickerBackground: some View {
    Rectangle()
      .fill(self.theme.backgroundColor)
      .frame(height: self.theme.height)
      .frame(maxWidth: .infinity)
      .clipShape(.rect(cornerRadius: self.theme.cornerRadius))
  }

  @ViewBuilder
  var pickerSelection: some View {
    Rectangle()
      .fill(self.theme.color.gradient)
      .frame(
        width: self.selectedValueWidth,
        height: self.theme.height
      )
      .clipShape(.rect(cornerRadius: self.theme.cornerRadius))
  }

  @ViewBuilder
  func divider(for value: Int) -> some View {
    Rectangle()
      .fill(
        self.shouldShowDivider(for: value)
        ? self.theme.dividerColor
        : .clear
      )
      .frame(
        width: 1,
        height: self.theme.height
      )
  }

  @ViewBuilder
  func label(for value: Int) -> some View {
    Text("\(value)")
      .font(
        self.selection == value
        ? .title3.bold()
        : .caption2.bold()
      )
      .foregroundStyle(
        self.selection == value
        ? self.theme.color
        : .gray
      )
      .fixedSize()
      .offset(y: self.selection == value ? 4 : 0)
  }
}

// MARK: Helpers

private extension SliderPicker {
  func shouldShowDivider(for value: Int) -> Bool {
    guard value != .zero && value != steps
    else { return false }
    guard let selection
    else { return true }
    return !(value < selection)
  }

  func getAlignment(for value: Int) -> Alignment {
    if value == .zero {
      return .bottomLeading
    } else if value == steps {
      return .bottomTrailing
    } else {
      return .bottom
    }
  }

  func getValue(for offset: CGFloat) -> Int {
    guard offset > 0 else { return .zero }
    guard offset < width else { return steps }
    return Int(offset / spacing) + 1
  }

  func updateSelectedValue(for offset: CGPoint) {
    guard !self.isScrolling else { return }
    self.selection = getValue(for: offset.x)
  }
}

// MARK: Preview

#if DEBUG
#Preview {
  VStack(spacing: 30) {
    SliderPicker(
      selection: .constant(7),
      isScrolling: .constant(false)
    )

    SliderPicker(
      selection: .constant(5),
      isScrolling: .constant(false)
    )
    .environment(
      \.sliderPickerTheme,
      .init(color: .green)
    )

    SliderPicker(
      selection: .constant(4),
      isScrolling: .constant(false),
      steps: 5
    )
    .environment(
      \.sliderPickerTheme,
      .init(color: .purple)
    )

    SliderPicker(
      selection: .constant(3),
      isScrolling: .constant(false),
      steps: 5
    )
    .environment(
      \.sliderPickerTheme,
       .init(
        color: .pink,
        height: 40
       )
    )
  }
  .padding(16)
}
#endif
