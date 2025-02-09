//
//  ContentView.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BorderRadiusViewModel()
    private let validator = BorderRadiusValidator()
    
    var body: some View {
        VStack(spacing: 32) {
            headerView
            
            cornerSelectionView
            
            PreviewBox(borderRadius: viewModel.borderRadius)
                .frame(maxWidth: 300).padding(EdgeInsets.init(top: 4, leading: 0, bottom: 0, trailing: 0))
            
            if !viewModel.selectedCorners.isEmpty {
                RadiusControl(
                    viewModel: viewModel,
                    validator: validator
                )
            } else {
                selectCornersPrompt
            }
            
            resetButton
        }
        .padding()
    }
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("Border Radius Previewer")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Select corners and adjust radius")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
    
    private var cornerSelectionView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(Corner.allCases) { corner in
                    CornerChip(
                        corner: corner,
                        isSelected: viewModel.selectedCorners.contains(corner)
                    ) {
                        viewModel.toggleCorner(corner)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private var selectCornersPrompt: some View {
        Text("Select corners to adjust radius")
            .font(.callout)
            .foregroundColor(.secondary)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
    
    private var resetButton: some View {
        Button(action: viewModel.reset) {
            Text("Reset")
                .fontWeight(.medium)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ContentView()
}
