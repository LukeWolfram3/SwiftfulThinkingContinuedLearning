//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/14/24.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
//        firstExample
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}

extension GeometryReaderBootcamp {
    
    private func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
        
    }
    
    
//    private var firstExample: some View {
        //        GeometryReader{ geometry in
        //            HStack(spacing: 0) {
        //                Rectangle().fill(Color.red)
        //                    .frame(width: geometry.size.width * 0.6666)
        //                Rectangle().fill(Color.blue)
        //            }
        //            .ignoresSafeArea()
        //        }
        //    }
}


