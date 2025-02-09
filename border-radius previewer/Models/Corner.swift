//
//  Corner.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import UIKit

enum Corner: String, CaseIterable, Identifiable {
    case all = "All corners"
    case topLeft = "Top Left"
    case topRight = "Top Right"
    case bottomLeft = "Bottom Left"
    case bottomRight = "Bottom Right"
    
    var id: String { rawValue }
}
