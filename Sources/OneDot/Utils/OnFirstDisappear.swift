//
//  OnFirstDisappear.swift
//  
//
//  Created by Alex Nagy on 15.08.2023.
//

import SwiftUI

@usableFromInline internal struct OnDisappearModifier: ViewModifier {
    
    @State private var onDisappearCalled = false
    private let action: (() -> Void)?
    
    @usableFromInline internal init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    @usableFromInline internal func body(content: Content) -> some View {
        content
            .onDisappear {
                if !onDisappearCalled {
                    onDisappearCalled = true
                    action?()
                }
            }
    }
}

public extension View {
    
    /// Adds an action to perform after this view disappears for the first time.
    ///
    /// The exact moment that SwiftUI calls this method
    /// depends on the specific view type that you apply it to, but
    /// the `action` closure doesn't execute until the view
    /// disappears from the interface.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` after it disappears.
    @inlinable func onFirstDisappear(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(OnDisappearModifier(perform: action))
    }
}


