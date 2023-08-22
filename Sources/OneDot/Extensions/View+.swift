//
//  View+.swift
//  
//
//  Created by Alex Nagy on 15.08.2023.
//

import SwiftUI

public extension View {
    
    /// Hides / unhides a view
    /// - Parameter shouldHide: hidden value
    /// - Returns: a view that is hidden or not
    @ViewBuilder
    func isHidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
    
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder
    func `if`<Content: View>(_ condition: @autoclosure () -> Bool, transform: (Self) -> Content) -> some View {
        if condition() {
            transform(self)
        } else {
            self
        }
    }
    
    /// Creates a `Push Out View` from a `Pull In View`
    /// - Parameter backgroundColor: The color of the area outside of the `Pull In View`
    /// - Returns: a `Push Out View`
    func asPushOutView(_ backgroundColor: Color = .clear) -> some View {
        ZStack {
            backgroundColor
            self
        }
    }
    
    /// Can create a `Push Out View` from a
    /// - Parameters:
    ///   - isPushOutView: should create a `Push Out View` from a `Pull In View`
    ///   - backgroundColor: The color of the area outside of the `Pull In View`
    /// - Returns: a `Push Out View` or a `Pull In View`
    @ViewBuilder
    func isPushOutView(_ isPushOutView: Bool = true, backgroundColor: Color = .clear) -> some View {
        if isPushOutView {
            ZStack {
                backgroundColor
                self
            }
        } else {
            self
        }
    }
    
    // Positions this view within an invisible frame with the specified size with a set .center alignment.
    /// - Parameter square: A fixed width and height for the resulting view. If `width` is `nil`, the resulting view assumes this view's sizing behavior.
    /// - Returns: A square view with fixed dimensions of `width` and `height`.
    func frame(square length: CGFloat?) -> some View {
        self.frame(width: length, height: length)
    }
}
