//
//  VisualEffectBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/23/24.
//

import SwiftUI

struct VisualEffectBootcamp: View {
    
    @State private var showSpacer: Bool = false
    
    var body: some View {
//        firstExample
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .visualEffect { content, geometry in
                            content
                                .offset(x: geometry.frame(in: .global).minY * 0.5)
                        }
                }
            }
        }
    }
}

#Preview {
    VisualEffectBootcamp()
}

extension VisualEffectBootcamp {
    private var firstExample: some View {
        VStack {
            Text("Hello! World this is to turn gray")
                .padding()
                .background(Color.red)
                .visualEffect { content, geometry in
                    content
                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
                    //                    .grayscale(geometry.size.width >= 200 ? 1 : 0)
                }
            if showSpacer {
                Spacer()
            }
        }
        .animation(.easeIn, value: showSpacer)
        .onTapGesture {
            showSpacer.toggle()
        }
    }
}
