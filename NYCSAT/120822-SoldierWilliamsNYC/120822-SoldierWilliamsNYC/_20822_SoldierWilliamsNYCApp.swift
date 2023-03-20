//
//  _20822_SoldierWilliamsNYCApp.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import SwiftUI

@main
struct _20822_SoldierWilliamsNYCApp: App {
    @StateObject var viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $viewModel.navigationPath) {
                SchoolListView(viewModel: viewModel)
            }
        }
    }
}
