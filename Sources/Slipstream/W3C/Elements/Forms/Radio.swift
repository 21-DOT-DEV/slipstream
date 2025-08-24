import SwiftSoup

/// A control that allows the user to select one option from a group of mutually exclusive options.
///
/// Radio buttons are typically used in groups where only one option can be selected
/// at a time. All radio buttons in a group should share the same name attribute.
///
/// ```swift
/// // Basic radio button
/// Radio(name: "size", value: "large")
///
/// // Radio button with ID for label association
/// Radio(name: "color", value: "red", id: "color-red")
///
/// // Pre-selected radio button
/// Radio(name: "plan", value: "premium", id: "plan-premium", checked: true)
///
/// // Radio button with accessibility features
/// Radio(name: "notifications", value: "email", required: true, autoFocus: true)
/// ```
///
/// - SeeAlso: W3C [input type="radio"](https://html.spec.whatwg.org/multipage/input.html#radio-button-state-(type=radio)) specification.
@available(iOS 17.0, macOS 14.0, *)
public struct Radio: View {
  /// Creates a radio button input.
  ///
  /// - Parameters:
  ///   - name: The name of the form control, as used in form submission. All radio buttons
  ///     in a group should share the same name.
  ///   - value: The value to be sent when the radio button is selected and the form is submitted.
  ///   - id: The unique identifier for the radio button, used for label association.
  ///   - checked: Whether the radio button should be checked by default.
  ///   - required: If true, indicates that the user must select one of the radio buttons
  ///     in this group before the owning form can be submitted.
  ///   - autoFocus: If true, indicates that the radio button should be focused as soon as
  ///     the page is loaded, allowing the user to interact with it without having to
  ///     manually focus it first.
  ///   - disabled: If true, indicates that the radio button is disabled and cannot be interacted with.
  public init(name: String? = nil, value: String? = nil, id: String? = nil, checked: Bool = false, required: Bool = false, autoFocus: Bool = false, disabled: Bool = false) {
    self.name = name
    self.value = value
    self.id = id
    self.checked = checked
    self.required = required
    self.autoFocus = autoFocus
    self.disabled = disabled
  }

  @_documentation(visibility: private)
  public func render(_ container: Element, environment: EnvironmentValues) throws {
    let element = try container.appendElement("input")
    try element.attr("type", "radio")
    
    if let name {
      try element.attr("name", name)
    }
    if let value {
      try element.attr("value", value)
    }
    if let id {
      try element.attr("id", id)
    }
    if checked {
      try element.attr("checked", "")
    }
    if required {
      try element.attr("required", "")
    }
    if autoFocus {
      try element.attr("autofocus", "")
    }
    if disabled {
      try element.attr("disabled", "")
    }
  }

  private let name: String?
  private let value: String?
  private let id: String?
  private let checked: Bool
  private let required: Bool
  private let autoFocus: Bool
  private let disabled: Bool
}
