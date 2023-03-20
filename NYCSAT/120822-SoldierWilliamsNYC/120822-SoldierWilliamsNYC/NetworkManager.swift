//
//  NetworkManager.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import Foundation

class NetworkManager {
    private let decoder = JSONDecoder()
    func download<Response>(_ endpoint: NetworkEndpoint<Response>) async throws -> Response {
        let (data, response) = try await URLSession.shared.data(from: endpoint.url)
        if let httpResponse = response as? HTTPURLResponse {
            if !(200...299).contains(httpResponse.statusCode) {
                throw URLError(.badServerResponse)
            }
        }
        let result = try decoder.decode(Response.self, from: data)
        return result
    }
}
