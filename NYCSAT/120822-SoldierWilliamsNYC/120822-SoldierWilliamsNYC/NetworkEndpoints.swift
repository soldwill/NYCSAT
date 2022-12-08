//
//  NetworkEndpoints.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import Foundation

struct NetworkEndpoint<Response: Decodable> {
    let url: URL
    let responseType: Response.Type
    init(url: URL, responseType: Response.Type) {
        self.url = url
        self.responseType = responseType
    }
}

struct NetworkEndpoints {
    
    static func score(dbn: String) -> NetworkEndpoint<[SAT]> {
        let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)")!
        return NetworkEndpoint(url: url, responseType: [SAT].self)
    }
    
    static func schools() -> NetworkEndpoint<[School]> {
        let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")!
        return NetworkEndpoint(url: url, responseType: [School].self)
    }
}
