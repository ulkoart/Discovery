//
//  TileModifier.swift
//  Discovery
//
//  Created by user on 24.08.2021.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModifer())
    }
}

struct TileModifer: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8, opacity: 1), radius: 4, x: 0.0, y: 2)
    }
}
