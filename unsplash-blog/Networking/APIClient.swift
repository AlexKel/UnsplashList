//
//  APIClient.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation


protocol APIClient {
    var clientID: String { get }
    func loadData<E: APIEndpoint, D: DataDecoder>(from endpoint: E, decoder: D) async throws -> D.Result
    func loadData<E: APIEndpoint, D: DataDecoder>(from endpoint: E, decoder: D, completion: @escaping (Result<D.Result, Error>) -> Void)
}

extension URLSession: APIClient {
    var clientID: String { "5-vEGT0LaLHeKZhed1Hi-ZHq3S_fm3id318lKcDVyLE" }
    
    func loadData<E: APIEndpoint, D: DataDecoder>(from endpoint: E, decoder: D) async throws -> D.Result {
        guard let request = endpoint.createRequest(clientID: clientID) else {
            throw "Failed to create request for endpoint"
        }
        
        let (data, _) = try await data(for: request)
        return try decoder.decode(from: data)
    }
    
    func loadData<E: APIEndpoint, D: DataDecoder>(from endpoint: E, decoder: D, completion: @escaping (Result<D.Result, Error>) -> Void) {
        guard let request = endpoint.createRequest(clientID: clientID) else {
            completion(.failure("Failed to create request for endpoint"))
            return
        }
        
        let task = dataTask(with: request) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
            
            if let data = data  {
                do {
                    let result = try decoder.decode(from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(.failure("Failed to get data"))
                }                
            }
        }
        task.resume()
    }
}
