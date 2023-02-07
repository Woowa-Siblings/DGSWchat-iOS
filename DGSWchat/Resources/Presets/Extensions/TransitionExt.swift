//
//  TransitionExt.swift
//  DGSWchat
//
//  Created by Mercen on 2023/02/07.
//

import SwiftUI

extension AnyTransition {
    static var backslide: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading))
    }
}
