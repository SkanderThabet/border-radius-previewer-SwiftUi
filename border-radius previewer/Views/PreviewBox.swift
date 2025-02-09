//
//  PreviewBox.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation
import SwiftUICore

struct PreviewBox : View {
    
    let borderRadius: BorderRadius
    let size: CGFloat = 200
    
    var body: some View {
            Rectangle()
                .fill(Color(.systemBlue))
                .frame(width: size, height: size)
                .clipShape(
                    RoundedRectangle(
                        topLeading: borderRadius.topLeft,
                        topTrailing: borderRadius.topRight,
                        bottomLeading: borderRadius.bottomLeft,
                        bottomTrailing: borderRadius.bottomRight
                    )
                )
                .overlay(CornerIndicators(borderRadius: borderRadius))
                .animation(.spring(response: 0.3), value: borderRadius)
        }
}
