//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/15/24.
//

import SwiftUI


// Strings comform to hashable, so it creates a unique ID for each string automatically
// You can see the hash value by using .hashValue.description

// When the data comforms to hashable, must use \.self, if it comforms to identifiable, you do not need to
// You can also combine multiple vars or constants in order to create a unique hashable id


struct MyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}




struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
       MyCustomModel(title: "THREE"),
       MyCustomModel(title: "FOUR"),
       MyCustomModel(title: "FIVE")
    ]

    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
            }
        }  
    }
}

#Preview {
    HashableBootcamp()
}
