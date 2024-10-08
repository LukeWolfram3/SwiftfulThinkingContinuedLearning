//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/13/24.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
//        firstExample
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.green : Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            
            HStack {
                Text("CLICK HERE")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                .cornerRadius(10)
                .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) { (isPressing) in
                    // start of press -> min duration
                    if isPressing {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isComplete = true
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if !isSuccess {
                                withAnimation(.easeInOut) {
                                    isComplete = false
                                }
                            }
                        }
                    }
                } perform: {
                    // at the min duration
                    withAnimation(.easeInOut) {
                        isSuccess = true
                    }
                }

                
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                .cornerRadius(10)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isComplete = false
                        isSuccess = false
                    }
                }

            }
        }
    }
}
#Preview {
    LongPressGestureBootcamp()
}

extension LongPressGestureBootcamp {
    
//    private var firstExample: some View {
//        Text(isComplete ? "COMPLETED" : "NOT COMPLETE")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
//            .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
//                isComplete.toggle()
//            }
//            .onTapGesture {
//                isComplete.toggle()
//            }
//    }
}
