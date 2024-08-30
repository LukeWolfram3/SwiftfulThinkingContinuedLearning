//
//  ArraysBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/15/24.
//

import SwiftUI


struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    
    init() {
        getUsers()
        updateFilteredArray()
    }
    
    func updateFilteredArray() {
        // sort
        /*
//        filteredArray = dataArray.sorted { (user1, user2) -> Bool in
//            return user1.points > user2.points
//        }
        
//        filteredArray = dataArray.sorted(by: { $0.points > $1.points })
        //This is the exact same thing as the comment above
        */
        
        // filter
        /*
//        filteredArray = dataArray.filter({ (user) -> Bool in
//            return user.isVerified
//        })
        
        filteredArray = dataArray.filter({ $0.isVerified })
         */
        
        // map
        /*
        
        mappedArray = dataArray.map({ (user) -> String in
            return user.name ?? "Error"
        })
        
        mappedArray = dataArray.map({ $0.name })
         
        mappedArray = dataArray.compactMap({ (user) -> String? in
            return user.name
        })
        mappedArray = dataArray.compactMap({ $0.name })
        //USE THE COMPACT ARRAY BECASUE IT CNA IGNORE OPTIONAL STRINGS
        */
        
        
        mappedArray = dataArray
            .sorted(by: { $0.points > $1.points })
            .filter({ $0.isVerified })
            .compactMap({ $0.name })
//Combination of all three
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Luke", points: 69, isVerified: true)
        let user2 = UserModel(name: "Chris", points: 0, isVerified: false)
        let user3 = UserModel(name: nil, points: 20, isVerified: false)
        let user4 = UserModel(name: "Emily", points: 35, isVerified: true)
        let user5 = UserModel(name: "Mark", points: 50, isVerified: true)
        let user6 = UserModel(name: "Samantha", points: 70, isVerified: true)
        let user7 = UserModel(name: "Twain", points: 10, isVerified: false)
        let user8 = UserModel(name: nil, points: 13, isVerified: true)
        let user9 = UserModel(name: "Steven", points: 28, isVerified: false)
        let user10 = UserModel(name: "Sam", points: 77, isVerified: false)
        self.dataArray.append(contentsOf: [
        user1,
        user2,
        user3,
        user4,
        user5,
        user6,
        user7,
        user8,
        user9,
        user10
        ])
    }
    
}


struct ArraysBootcamp: View {
    @StateObject var viewModel = ArrayModificationViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(viewModel.mappedArray, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
                
                
//                ForEach(viewModel.filteredArray) { user in
//                    VStack(alignment: .leading) {
//                        Text(user.name).font(.headline)
//                        HStack {
//                            Text("Points: \(user.points)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .foregroundStyle(.white)
//                    .padding()
//                    .background(Color.blue.cornerRadius(10))
//                    .padding(.horizontal)
//                }
            }
        }
    }
}

#Preview {
    ArraysBootcamp()
}
