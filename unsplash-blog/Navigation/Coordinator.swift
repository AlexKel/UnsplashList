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
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
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
            let viewModel = PhotoListViewModel(apiClient: apiClient)
            PhotoListView(viewModel: viewModel)
        case .photoDetail(let photo):
            PhotoDetailsView(photo: photo)
        }
    }
}
