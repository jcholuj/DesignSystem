import Foundation

public struct ValidationState<Value> {
  public var value: Value
  public var errorMessage: String?
  private let validator: (Value) -> String?

  public func validate() -> String? {
    self.validator(self.value)
  }

  public func validate(_ value: Value) -> String? {
    self.validator(value)
  }

  public mutating func validate(_ value: Value) {
    self.errorMessage = self.validator(value)
  }

  public init(
    value: Value,
    errorMessage: String? = nil,
    validator: @escaping (Value) -> String?
  ) {
    self.value = value
    self.errorMessage = errorMessage
    self.validator = validator
  }
}
