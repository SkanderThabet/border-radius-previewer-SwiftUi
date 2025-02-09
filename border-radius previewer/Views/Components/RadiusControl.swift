//
//  RadiusControl.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation
import SwiftUICore

struct RadiusControl: View {
    @ObservedObject var viewModel: BorderRadiusViewModel
    let validator: BorderRadiusValidating
    
    @State private var sliderValue: CGFloat = 0
    @State private var textValue: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            CustomSlider(
                value: $sliderValue,
                range: 0...100,
                validator: validator
            )
            .onChange(of: sliderValue) { newValue in
                viewModel.updateRadius(newValue, for: viewModel.selectedCorners)
            }
            
            ValidatedTextField(
                text: $textValue,
                validator: validator,
                onCommit: { value in
                    if let radius = NumberFormatter.shared.number(from: value)?.doubleValue {
                        viewModel.updateRadius(CGFloat(radius), for: viewModel.selectedCorners)
                    }
                }
            )
        }
        .padding()
    }
}
