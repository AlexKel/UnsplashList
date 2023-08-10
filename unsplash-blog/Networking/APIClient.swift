//
//  APIClient.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation


protocol APIClient {
    func loadData<E: APIEndpoint, D: DataDecoder>(from endpoint: E, decoder: D) async throws -> D.Result
}

extension URLSession: APIClient {
    func loadData<E: APIEndpoint, D: DataDecoder>(from endpoint: E, decoder: D) async throws -> D.Result {
        guard let request = endpoint.createRequest() else {
            throw "Failed to create request for endpoint"
        }
        
        let (data, _) = try await data(for: request)
        return try decoder.decode(from: data)
    }
}
