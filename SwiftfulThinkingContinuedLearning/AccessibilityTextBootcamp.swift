//
//  AccessibilityTextBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/21/24.
//

import SwiftUI

// Dynamic Text

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.dynamicTypeSize) var sizeCategory
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("Welcome to my app")
                                .truncationMode(.tail)
                        }
                        .font(.title)
                        Text("This is some longer text that expands to mulitple lines.")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(3)
                            .minimumScaleFactor(sizeCategory == .accessibility4 ? 0.8 : 1.0)
                    }
//                    .frame(height: 100)
                    .background(Color.red)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Hello, world!")
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}

extension ContentSize
