//
//  PhotoListView.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import SwiftUI

struct PhotoListView: View {
    @ObservedObject var viewModel: PhotoListViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.load)
        case .loading:
            ProgressView()
        case .failed(let error):
            ErrorView(error: error) {
                viewModel.load()
            }
        case .loaded(let data):
            ScrollView(.horizontal) {
                LazyHGrid(rows: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 10) {
                    ForEach(data, id: \.id) { photo in
                        AsyncImage(url: URL(string: photo.urls.small)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .onTapGesture {
                            coordinator.push(page: .photoDetail(photo: photo))
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        
    }
}

struct PhotosListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
//        PhotoListView()
    }
}
