//
//  School.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import Foundation

struct School: Decodable {
    let dbn: String
    let school_name: String?
    let building_code: String?
    
    let primary_address_line_1: String?
    let city: String?
    let zip: String?
    let state_code: String?
    
    let website: String?
    
}

extension School: Identifiable, Hashable {
    var id: String { dbn }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
