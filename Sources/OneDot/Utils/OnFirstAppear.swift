//
//  OnFirstAppear.swift
//  
//
//  Created by Alex Nagy on 15.08.2023.
//

import SwiftUI

@usableFromInline internal struct OnAppearModifier: ViewModifier {
    
    @State private var onAppearCalled = false
    private let action: (() -> Void)?
    
    @usableFromInline internal init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    @usableFromInline internal func body(content: Content) -> some View {
        content
            .onAppear {
                if !onAppearCalled {
                    onAppearCalled = true
                    action?()
                }
            }
    }
}

public extension View {
    
    /// Adds an action to perform before this view appears for the first time.
    ///
    /// The exact moment that SwiftUI calls this method
    /// depends on the specific view type that you apply it to, but
    /// the `action` closure completes before the first
    /// rendered frame appears.
    ///
    /// - Parameter action: The action to perform. If `action` is `nil`, the
    ///   call has no effect.
    ///
    /// - Returns: A view that triggers `action` before it appears.
    @inlinable func onFirstAppear(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(OnAppearModifier(perform: action))
    }
}

