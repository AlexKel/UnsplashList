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
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [
                        GridItem(.fixed(geometry.size.height / 4 - 10)),
                        GridItem(.fixed(geometry.size.height / 4 - 10)),
                        GridItem(.fixed(geometry.size.height / 4 - 10)),
                        GridItem(.fixed(geometry.size.height / 4 - 10)),
                    ], spacing: 10) {
                        ForEach(data) { photo in
                            AsyncImage(url: URL(string: photo.urls.small)) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } else if phase.error != nil {
                                    VStack {
                                        Image(systemName: "exclamationmark.triangle.fill")
                                            .foregroundColor(.gray.opacity(0.4))
                                        Text(phase.error!.localizedDescription).foregroundColor(.gray)
                                    }
                                    
                                } else {
                                    ProgressView()
                                }
                            }
                            .frame(width: geometry.size.width / 2 - 10, height: geometry.size.height / 4 - 10)
                            .onTapGesture {
                                coordinator.push(page: .photoDetail(photo: photo))
                            }
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                        }t
                    }
                    .padding(10)
                }
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
