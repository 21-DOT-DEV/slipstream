//
//  RenderStyles.swift
//  Slipstream
//
//  Copyright (c) 2025 21.dev
//  Distributed under the MIT software license
//

import Foundation

/// Renders styles by combining base CSS with component-specific styles.
///
/// This function reads a base CSS file and appends CSS from all component instances
/// conforming to `HasComponentCSS`, then writes the combined result to an output file.
///
/// - Parameters:
///   - components: Array of component instances that conform to `HasComponentCSS`
///   - baseCSS: URL to the base CSS file to read
///   - output: URL where the combined CSS should be written
///
/// - Throws: File I/O errors if reading or writing fails
public func renderStyles(
    from components: [any HasComponentCSS],
    baseCSS: URL,
    to output: URL
) throws {
    var cssContent = ""
    
    // Read base CSS file
    let baseContent = try String(contentsOf: baseCSS, encoding: .utf8)
    cssContent += baseContent
    cssContent += "\n\n"
    
    // Add component-specific styles
    cssContent += "/* Component-specific styles */\n"
    
    for component in components {
        cssContent += "/* \(component.componentName) */\n"
        cssContent += component.componentCSS
        cssContent += "\n\n"
    }
    
    // Ensure output directory exists
    let outputDir = output.deletingLastPathComponent()
    try FileManager.default.createDirectory(at: outputDir, withIntermediateDirectories: true)
    
    // Write combined CSS to output file
    try cssContent.write(to: output, atomically: true, encoding: .utf8)
    
    print("✅ Rendered styles: \(components.count) components → \(output.lastPathComponent)")
}
