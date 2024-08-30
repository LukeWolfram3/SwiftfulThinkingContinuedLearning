//
//  AlignmentGuideBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/23/24.
//

import SwiftUI
// AignmentGuide is a good substitute for geometry reader that actually changes the alignment of the VStack
// https://swiftui-lab.com/alignment-guides/

struct AlignmentGuideBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello!")
                .background(Color.blue)
                .alignmentGuide(.leading, computeValue: { dimension in
                    return dimension.width * 0.5
                })
            Text("This is some other text!")
                .background(.red)
        }
        .background(.orange)
    }
}

struct AlignmnetChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            row(title: "Row 1", showIcon: false)
            row(title: "Row 2", showIcon: true)
            row(title: "Row 3", showIcon: false)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 30)
//                    .opacity(showIcon ? 1 : 0)
            }
            Text(title)
            Spacer()
        }
        .alignmentGuide(.leading, computeValue: { dimension in
            return showIcon ? 40 : 0
        })
        
    }
}

#Preview {
    AlignmnetChildView()
}
