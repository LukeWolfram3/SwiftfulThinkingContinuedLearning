//
//  AccessibilityColorsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/22/24.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var DifferentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var InvertColors



    
    var body: some View {
        NavigationStack {
            VStack {
                
                Button("Button 1") {
                    
                }
                .foregroundStyle(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
                Button("Button 2") {
                    
                }
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                Button("Button 3") {
                    
                }
                .foregroundStyle(.white)
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                Button("Button 4") {
                    
                }
                .foregroundStyle(DifferentiateWithoutColor ? .white : .green)
                .foregroundStyle(.primary)
                .buttonStyle(.borderedProminent)
                .tint(DifferentiateWithoutColor ? .black : .purple)
                
            }
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
//            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        }
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
