import Testing

import Slipstream

struct RadioTests {
  @Test func basic() throws {
    try #expect(renderHTML(Radio()) == #"<input type="radio" />"#)
  }

  @Test func withName() throws {
    try #expect(renderHTML(Radio(name: "size")) == #"<input type="radio" name="size" />"#)
  }

  @Test func withValue() throws {
    try #expect(renderHTML(Radio(value: "large")) == #"<input type="radio" value="large" />"#)
  }

  @Test func withId() throws {
    try #expect(renderHTML(Radio(id: "size-large")) == #"<input type="radio" id="size-large" />"#)
  }

  @Test func checked() throws {
    try #expect(renderHTML(Radio(checked: true)) == #"<input type="radio" checked />"#)
  }

  @Test func required() throws {
    try #expect(renderHTML(Radio(required: true)) == #"<input type="radio" required />"#)
  }

  @Test func autoFocus() throws {
    try #expect(renderHTML(Radio(autoFocus: true)) == #"<input type="radio" autofocus />"#)
  }

  @Test func disabled() throws {
    try #expect(renderHTML(Radio(disabled: true)) == #"<input type="radio" disabled />"#)
  }

  @Test func allAttributes() throws {
    try #expect(renderHTML(Radio(name: "plan", value: "premium", id: "plan-premium", checked: true, required: true, autoFocus: true, disabled: false)) == #"<input type="radio" name="plan" value="premium" id="plan-premium" checked required autofocus />"#)
  }

  @Test func allAttributesIncludingDisabled() throws {
    try #expect(renderHTML(Radio(name: "plan", value: "basic", id: "plan-basic", checked: false, required: true, autoFocus: false, disabled: true)) == #"<input type="radio" name="plan" value="basic" id="plan-basic" required disabled />"#)
  }

  @Test func radioGroupUseCase() throws {
    // Test typical radio button group use case
    let sizeOptions = [
      Radio(name: "size", value: "small", id: "size-small"),
      Radio(name: "size", value: "medium", id: "size-medium", checked: true),
      Radio(name: "size", value: "large", id: "size-large")
    ]
    
    try #expect(renderHTML(sizeOptions[0]) == #"<input type="radio" name="size" value="small" id="size-small" />"#)
    try #expect(renderHTML(sizeOptions[1]) == #"<input type="radio" name="size" value="medium" id="size-medium" checked />"#)
    try #expect(renderHTML(sizeOptions[2]) == #"<input type="radio" name="size" value="large" id="size-large" />"#)
  }

  @Test func colorSelectionUseCase() throws {
    // Test another common radio button use case
    try #expect(renderHTML(Radio(name: "color", value: "red", id: "color-red")) == #"<input type="radio" name="color" value="red" id="color-red" />"#)
  }

  @Test func planSelectionUseCase() throws {
    // Test radio button for plan selection (business use case)
    try #expect(renderHTML(Radio(name: "subscription", value: "premium", id: "sub-premium", checked: true, required: true)) == #"<input type="radio" name="subscription" value="premium" id="sub-premium" checked required />"#)
  }
}
