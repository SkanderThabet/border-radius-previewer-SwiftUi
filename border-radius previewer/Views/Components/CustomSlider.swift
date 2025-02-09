//
//  CustomSlider.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation
import SwiftUICore
import SwiftUI

struct CustomSlider: View {
    @Binding var value: CGFloat
    let range: ClosedRange<CGFloat>
    let validator: BorderRadiusValidating
    
    var body: some View {
        HStack {
            Text("\(Int(range.lowerBound))")
            Slider(value: $value, in: range) { editing in
                if !editing && !validator.isValid(value) {
                    value = max(min(value, range.upperBound), range.lowerBound)
                }
            }
            Text("\(Int(range.upperBound))")
        }
    }
}
