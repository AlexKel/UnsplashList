//
//  Endpoint.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

/// Protocol of an endpoint
protocol APIEndpoint {
    var path: String { get set }
    var queryItems: [URLQueryItem] { get set }
    func createComponents(clientID: String) -> URLComponents
    func createRequest(clientID: String) -> URLRequest?
}

// Default implementation
struct Endpoint<Response: Decodable>: APIEndpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
    private var host: String { "api.unsplash.com" }
    
    func createComponents(clientID: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/\(path)"
        // Clinet ID combined with endpoint specific query items
        components.queryItems = queryItems + [URLQueryItem(name: "client_id", value: clientID)]
        return components
    }
    
    func createRequest(clientID: String) -> URLRequest? {
        guard let url = createComponents(clientID: clientID).url else {
            return nil
        }
        return URLRequest(url: url)
    }
}

/// Quick access endpoint
extension Endpoint where Response == [Photo] {
    static var photos: Self {
        Endpoint(path: UnsplashAPIPaths.photos.rawValue)
    }
}
