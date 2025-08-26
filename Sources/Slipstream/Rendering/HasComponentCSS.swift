//
//  HasComponentCSS.swift
//  Slipstream
//
//  Copyright (c) 2025 21.dev
//  Distributed under the MIT software license
//

import Foundation

//// A protocol for components that provide CSS styles.
///
/// Components conforming to this protocol can expose CSS styles that should be
/// included in the final stylesheet during the build process.
///
/// Example:
/// ```swift
/// struct MyComponent: View, HasComponentCSS {
///     var componentCSS: String {
///         """
///         .my-component {
///             background-color: red;
///         }
///         """
///     }
///     
///     var componentName: String { "MyComponent" }
///     
///     var body: some View {
///         // Component implementation
///     }
/// }
/// ```
public protocol HasComponentCSS {
    /// The CSS styles for this component instance.
    var componentCSS: String { get }
    
    /// A descriptive name for this component (used in CSS comments).
    var componentName: String { get }
}

public extension HasComponentCSS {
    /// Default component name derived from the type name
    var componentName: String {
        String(describing: type(of: self))
    }
}
