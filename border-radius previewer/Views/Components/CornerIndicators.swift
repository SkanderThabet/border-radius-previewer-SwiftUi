//
//  CornerIndicators.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation
import SwiftUICore

struct CornerIndicators: View {
    let borderRadius: BorderRadius
        private let offset: CGFloat = 8
        
        var body: some View {
            GeometryReader { geometry in
                ZStack {
                    ForEach(Corner.allCases.filter { $0 != .all }) { corner in
                        CornerIndicator(
                            value: radius(for: corner),
                            position: position(for: corner, in: geometry)
                        )
                    }
                }
            }
        }
    
    private func radius(for corner: Corner) -> CGFloat {
            switch corner {
            case .topLeft:
                return borderRadius.topLeft
            case .topRight:
                return borderRadius.topRight
            case .bottomLeft:
                return borderRadius.bottomLeft
            case .bottomRight:
                return borderRadius.bottomRight
            case .all:
                return 0
            }
        }
        
        private func position(for corner: Corner, in geometry: GeometryProxy) -> CGPoint {
            let size = geometry.size
            switch corner {
            case .topLeft:
                return CGPoint(x: -offset, y: offset)
            case .topRight:
                return CGPoint(x: size.width + offset + 24, y: offset)
            case .bottomLeft:
                return CGPoint(x: -offset, y: size.height + offset)
            case .bottomRight:
                return CGPoint(x: size.width + offset + 24, y: size.height + offset)
            case .all:
                return .zero
            }
        }
}
