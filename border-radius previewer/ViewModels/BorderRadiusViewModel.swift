//
//  BorderRadiusViewModel.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation

@MainActor
final class BorderRadiusViewModel : ObservableObject {
    @Published private(set) var borderRadius = BorderRadius.zero
    @Published private(set) var selectedCorners: Set<Corner> = []
    
    private let validator : BorderRadiusValidating
    
    init(validator: BorderRadiusValidating = BorderRadiusValidator()) {
        self.validator = validator
    }
    
    func updateRadius(_ value: CGFloat, for corners:Set<Corner>){
        guard validator.isValid(value) else {return}
        corners.forEach { corner in
                    switch corner {
                    case .all : borderRadius = BorderRadius(topLeft: value, topRight: value,
                                                             bottomLeft: value, bottomRight: value)
                        case .topLeft: borderRadius.topLeft = value
                        case .topRight: borderRadius.topRight = value
                        case .bottomLeft: borderRadius.bottomLeft = value
                        case .bottomRight: borderRadius.bottomRight = value
                    }
                }
    }
    
    func toggleCorner(_ corner: Corner) {
                if corner == .all {
                    selectedCorners = selectedCorners.contains(.all) ? [] : [.all]
                    return
                }
                
                if selectedCorners.contains(.all) {
                    selectedCorners.remove(.all)
                }
                
                if selectedCorners.contains(corner) {
                    selectedCorners.remove(corner)
                } else {
                    selectedCorners.insert(corner)
                }
                
                // Check if all individual corners are selected
                let individualCorners = Corner.allCases.filter { $0 != .all }
                if selectedCorners.intersection(individualCorners).count == individualCorners.count {
                    selectedCorners = [.all]
                }
        }
        
    func reset() {
            borderRadius = .zero
            selectedCorners.removeAll()
        }
    
}
