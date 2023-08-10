//
//  Coordinator.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    private let apiClient: APIClient
    private let photoListViewModel: PhotoListViewModel
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        self.photoListViewModel = PhotoListViewModel(apiClient: apiClient)
    }
    
    func push(page: Page) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .home:
            PhotoListView(viewModel: photoListViewModel)
        case .photoDetail(let photo):
            PhotoDetailsView(photo: photo)
        }
    }
}
