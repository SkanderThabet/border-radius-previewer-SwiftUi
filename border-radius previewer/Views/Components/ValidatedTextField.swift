//
//  ValidatedTextField.swift
//  border-radius previewer
//
//  Created by Skander Thabet on 09/02/2025.
//

import Foundation
import SwiftUICore
import SwiftUI

struct ValidatedTextField: View {
   @Binding var text: String
   let validator: BorderRadiusValidating
   let onCommit: (String) -> Void
   
   @State private var isError = false
   @State private var errorMessage = ""
   @FocusState private var isFocused: Bool
   
   var body: some View {
       VStack(alignment: .leading, spacing: 8) {
           HStack {
               Text("Radius")
                   .font(.subheadline)
                   .foregroundColor(.secondary)
               
               Spacer()
               
               Text("0-100")
                   .font(.caption)
                   .foregroundColor(.secondary)
           }
           
           TextField("Enter value", text: $text)
               .font(.body)
               .padding(12)
               .background(Color(.systemGray6))
               .cornerRadius(8)
               .keyboardType(.decimalPad)
               .focused($isFocused)
               .overlay(
                RoundedRectangle(topLeading: 8, topTrailing: 8, bottomLeading: 8, bottomTrailing: 8)
                       .stroke(isError ? Color.red : Color.clear, lineWidth: 1.5)
               )
               .onChange(of: text) { newValue in
                   if !validator.validateInput(newValue) {
                       isError = true
                       errorMessage = "Only numbers are allowed"
                       return
                   }
                   
                   if let number = NumberFormatter.shared.number(from: newValue),
                      let value = CGFloat(exactly: number) {
                       isError = !validator.isValid(value)
                       errorMessage = isError ? "Value must be between 0 and 100" : ""
                   }
               }
               .onSubmit {
                   if !isError {
                       onCommit(text)
                   }
               }
           
           if isError {
               HStack(spacing: 4) {
                   Image(systemName: "exclamationmark.circle.fill")
                       .foregroundColor(.red)
                       .font(.caption)
                   
                   Text(errorMessage)
                       .font(.caption)
                       .foregroundColor(.red)
               }
               .padding(.horizontal, 4)
               .transition(.opacity)
               .animation(.easeInOut, value: isError)
           }
       }
   }
}
