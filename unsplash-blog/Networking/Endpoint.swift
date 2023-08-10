//
//  Endpoint.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

/// Protocol of an endpoint
protocol APIEndpoint {
    var clientID: String { get set }
    var path: String { get set }
    var queryItems: [URLQueryItem] { get set }
    func createComponents() -> URLComponents
    func createRequest() -> URLRequest?
}

// Default implementation
struct Endpoint<Response: Decodable>: APIEndpoint {
    var clientID: String
    var path: String
    var queryItems: [URLQueryItem] = []
    private var host: String { "api.unsplash.com" }
    
    func createComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/\(path)"
        // Clinet ID combined with endpoint specific query items
        components.queryItems = queryItems + [URLQueryItem(name: "client_id", value: clientID)]
        return components
    }
    
    func createRequest() -> URLRequest? {
        guard let url = createComponents().url else {
            return nil
        }
        return URLRequest(url: url)
    }
}

/// Quick access endpoint
extension Endpoint where Response == [Photo] {
    static func photos(clientID: String) -> Self {
        Endpoint(clientID: clientID, path: UnsplashAPIPaths.photos.rawValue)
    }
}
