//
//  ViewModel.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var navigationPath = NavigationPath()
    @Published var isFetchingSchools = false
    @Published var isFetchingSATs = false
    
    @Published var schools = [School]()
    
    @Published var failedToFetchSchools = false
    @Published var failedToFetchSATs = false
    
    private let networkManager = NetworkManager()
    
    static func preview() -> ViewModel {
        let result = ViewModel()
        return result
    }
    
    init() {
        fetchSchools()
    }
    
    func fetchSchools() {
        
        failedToFetchSchools = false
        isFetchingSchools = true
        Task {
            var _schools = [School]()
            
            do {
                _schools = try await networkManager.download(NetworkEndpoints.schools())
            } catch let error {
                print("fetchSchools error \(error)")
                await MainActor.run {
                    failedToFetchSchools = true
                }
            }
            let __schools = _schools
            
            await MainActor.run {
                schools = __schools
                isFetchingSchools = false
            }
        }
    }
    
    func select(school: School) {
        
        failedToFetchSATs = false
        isFetchingSATs = true
        Task {
            
            var _sats = [SAT]()
            do {
                _sats = try await networkManager.download(NetworkEndpoints.score(dbn: school.dbn))
            } catch let error {
                print("select(\(school.dbn) error \(error)")
            }
            
            guard _sats.count > 0 else {
                await MainActor.run {
                    failedToFetchSATs = true
                    isFetchingSATs = false
                }
                return
            }
            
            let sat = _sats[0]
            let schoolWithSAT = SchoolWithSAT(school: school, sat: sat)
            await MainActor.run {
                navigationPath.append(schoolWithSAT)
                failedToFetchSATs = false
                isFetchingSATs = false
            }
        }
    }
    
    func selectAsync(school: School) async {
        
    }
    
}
