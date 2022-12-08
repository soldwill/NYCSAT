//
//  SchoolListView.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import SwiftUI

struct SchoolListView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State private var scrollOvershoot: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { outerGeometry in
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.schools) { school in
                        Button {
                            viewModel.select(school: school)
                        } label: {
                            schoolCell(school)
                        }
                    }
                }
            }
            .frame(width: outerGeometry.size.width)
        }
        .navigationDestination(for: SchoolWithSAT.self) { schoolWithSAT in
            DetailView(schoolWithSAT: schoolWithSAT, viewModel: viewModel)
        }
        .alert("Schools could not load.", isPresented: $viewModel.failedToFetchSchools) {
            Button("O.K.") { }
        }
        .alert("SAT scores could not load", isPresented: $viewModel.failedToFetchSATs) {
            Button("O.K.") { }
        }
        .overlay(LoadingOverlay(isLoading: (viewModel.isFetchingSATs || viewModel.isFetchingSchools)))
    }
    
    func schoolCell(_ school: School) -> some View {
        let name = school.school_name ?? "Unknown"
        return HStack {
            VStack {
                HStack {
                    Text(name)
                        .font(.title)
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                    
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                        .frame(width: 40, height: 52)
                        .padding(.all, 6)
                        .padding(.trailing, 10)
                }
                .padding(.leading, 24)
                .padding(.vertical, 8)
            }
            .background(RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color(red: 0.955, green: 0.955, blue: 0.955)))
            .background(RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(Color(red: 0.725, green: 0.725, blue: 0.725)))
            
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 8)
        
    }
}

struct SchoolListView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView(viewModel: ViewModel.preview())
    }
}
