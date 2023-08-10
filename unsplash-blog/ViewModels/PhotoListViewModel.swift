//
//  PhotoListViewModel.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

class PhotoListViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([Photo])
    }
    
    @Published private(set) var state = State.idle
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func load() {
        state = .loading
        let endpoint = Endpoint.photos
        apiClient.loadData(from: endpoint, decoder: JSONPhotoDecoder()) { [weak self] result in
            switch result {
            case .success(let photos):
                self?.state = .loaded(photos)
            case .failure(let error):
                self?.state = .failed(error)
            }
        }
    }
}
