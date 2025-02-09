//
//  BorderRadius.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation

struct BorderRadius : Equatable {
    var topLeft: CGFloat
    var topRight: CGFloat
    var bottomLeft: CGFloat
    var bottomRight: CGFloat
    static let zero = BorderRadius(topLeft: 0, topRight: 0, bottomLeft: 0, bottomRight: 0)
}
