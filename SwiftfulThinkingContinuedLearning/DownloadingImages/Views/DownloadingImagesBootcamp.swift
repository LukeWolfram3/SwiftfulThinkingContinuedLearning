//
//  DownloadingImagesBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Luke Wolfram on 8/20/24.
//

import SwiftUI

struct DownloadingImagesBootcamp: View {
    
    @StateObject var viewModel = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray) { model in
                    DownloadingImageRows(model: model)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
