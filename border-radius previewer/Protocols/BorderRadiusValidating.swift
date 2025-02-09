//
//  BorderRadiusValidating.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation


protocol BorderRadiusValidating {
    func isValid(_ value: CGFloat) -> Bool
    func validateInput(_ string: String) -> Bool
}
