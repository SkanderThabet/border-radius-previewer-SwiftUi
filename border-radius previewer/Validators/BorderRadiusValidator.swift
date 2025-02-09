//
//  BorderRadiusValidator.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation

struct BorderRadiusValidator: BorderRadiusValidating {
    
    private let maxRadius: CGFloat = 100
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.allowsFloats = true
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    func isValid(_ value: CGFloat) -> Bool {
        value >= 0 && value <= maxRadius
    }
    
    func validateInput(_ string: String) -> Bool {
        guard !string.isEmpty else { return true }
                
            // Allow decimal point during typing
            if string == "." || string == "," {
                    return true
                }
                
            // Check for invalid characters (non-numeric)
            let validCharacters = CharacterSet(charactersIn: "0123456789.,")
            guard string.rangeOfCharacter(from: validCharacters.inverted) == nil else {
                return false
            }
            
            // Validate numeric value
            guard let number = numberFormatter.number(from: string),
                  let value = CGFloat(exactly: number) else {
                return false
            }
                
            return isValid(value)
    }
}
