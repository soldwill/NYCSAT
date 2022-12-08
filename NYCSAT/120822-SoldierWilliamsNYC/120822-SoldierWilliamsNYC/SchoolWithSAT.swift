//
//  SchoolWithSAT.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import Foundation

struct SchoolWithSAT {
    let school: School
    let sat: SAT
    init(school: School, sat: SAT) {
        self.school = school
        self.sat = sat
    }
}

extension SchoolWithSAT: Identifiable, Hashable {
    var id: String { school.dbn }
    
    static func == (lhs: SchoolWithSAT, rhs: SchoolWithSAT) -> Bool {
        lhs.school.dbn == rhs.school.dbn
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
