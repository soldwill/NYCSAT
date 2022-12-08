//
//  LoadingOverlay.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import SwiftUI

struct LoadingOverlay: View {
    var isLoading: Bool
    
    @ViewBuilder
    var body: some View {
        if isLoading {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .dynamicTypeSize(.xLarge)
                            .tint(.white)
                    }
                    .frame(width: 64, height: 64)
                    .background(RoundedRectangle(cornerRadius: 12).fill().foregroundColor(.black.opacity(0.85)))
                    Spacer()
                }
                Spacer()
            }
            .background(Color.black.opacity(0.85))
        }
    }
}

struct LoadingOverlay_Previews: PreviewProvider {
    static var previews: some View {
        LoadingOverlay(isLoading: true)
    }
}
