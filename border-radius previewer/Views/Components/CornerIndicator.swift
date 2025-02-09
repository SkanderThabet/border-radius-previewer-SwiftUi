//
//  CornerIndicator.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation
import SwiftUICore

struct CornerIndicator: View {
    let value: CGFloat
    let position: CGPoint
    
    private let indicatorSize: CGFloat = 24
    private let lineWidth: CGFloat = 2
    
    var body: some View {
        ZStack {
            // Circular background
            Circle()
                .fill(Color(.systemBackground))
                .frame(width: indicatorSize, height: indicatorSize)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
            
            // Value label
            Text("\(Int(value))")
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.primary)
        }
        .overlay(
            Circle()
                .strokeBorder(Color.blue, lineWidth: lineWidth)
        )
        .position(
            x: position.x + (position.x == 0 ? indicatorSize/2 : -indicatorSize/2),
            y: position.y + (position.y == 0 ? indicatorSize/2 : -indicatorSize/2)
        )
        .animation(.spring(response: 0.3), value: value)
    }
}
