//
//  RoundedRectangle.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation
import SwiftUICore

struct RoundedRectangle: Shape {
    var topLeading: CGFloat
    var topTrailing: CGFloat
    var bottomLeading: CGFloat
    var bottomTrailing: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        // Top left corner
        path.move(to: CGPoint(x: 0, y: topLeading))
        path.addQuadCurve(
            to: CGPoint(x: topLeading, y: 0),
            control: CGPoint(x: 0, y: 0)
        )
        
        // Top right corner
        path.addLine(to: CGPoint(x: width - topTrailing, y: 0))
        path.addQuadCurve(
            to: CGPoint(x: width, y: topTrailing),
            control: CGPoint(x: width, y: 0)
        )
        
        // Bottom right corner
        path.addLine(to: CGPoint(x: width, y: height - bottomTrailing))
        path.addQuadCurve(
            to: CGPoint(x: width - bottomTrailing, y: height),
            control: CGPoint(x: width, y: height)
        )
        
        // Bottom left corner
        path.addLine(to: CGPoint(x: bottomLeading, y: height))
        path.addQuadCurve(
            to: CGPoint(x: 0, y: height - bottomLeading),
            control: CGPoint(x: 0, y: height)
        )
        
        path.closeSubpath()
        return path
    }
}
