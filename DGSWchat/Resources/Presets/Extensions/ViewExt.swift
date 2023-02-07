//
//  ViewExt.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

// MARK: - Function Extensions of View
extension View {
    
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder func elevation() -> some View {
        self
            .shadow(color: SWColor.shadow.opacity(0.8), radius: 8, x: 2, y: 4)
            .zIndex(1)
    }
}

// MARK: - Function Extensions of UINavigationController
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
