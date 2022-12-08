//
//  SchoolWithSATFormatter.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import Foundation

struct SchoolWithSATFormatter {
    
    let schoolWithSAT: SchoolWithSAT
    init(schoolWithSAT: SchoolWithSAT) {
        self.schoolWithSAT = schoolWithSAT
    }
    
    func name() -> String {
        return schoolWithSAT.school.school_name ?? ""
    }
    
    func website() -> String {
        return "https://\(schoolWithSAT.school.website ?? "")"
    }
    
    func addressLine1() -> String {
        return schoolWithSAT.school.primary_address_line_1 ?? ""
    }
    
    func addressLine2() -> String {
        let part1 = schoolWithSAT.school.city ?? ""
        let part2 = schoolWithSAT.school.state_code ?? ""
        let part3 = schoolWithSAT.school.zip ?? ""
        return "\(part1), \(part2) \(part3)"
    }
    
    func numberOfStudents() -> String {
        return "Number of students: \(schoolWithSAT.sat.num_of_sat_test_takers ?? "")"
    }
    
    func criticalReading() -> String {
        return "Critical Reading: \(schoolWithSAT.sat.sat_critical_reading_avg_score ?? "")"
    }
    
    func writing() -> String {
        return "Writing: \(schoolWithSAT.sat.sat_writing_avg_score ?? "")"
    }
    
    func math() -> String {
        return "Math: \(schoolWithSAT.sat.sat_math_avg_score ?? "")"
    }
    
}
