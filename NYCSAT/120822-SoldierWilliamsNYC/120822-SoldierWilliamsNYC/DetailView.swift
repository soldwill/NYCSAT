//
//  DetailView.swift
//  120822-SoldierWilliamsNYC
//
//  Created by Soldier Williams on 12/8/22.
//

import SwiftUI

struct DetailView: View {
    
    var schoolWithSAT: SchoolWithSAT
    let formatter: SchoolWithSATFormatter
    @ObservedObject var viewModel: ViewModel
    
    init(schoolWithSAT: SchoolWithSAT, viewModel: ViewModel) {
        self.schoolWithSAT = schoolWithSAT
        self.formatter = SchoolWithSATFormatter(schoolWithSAT: schoolWithSAT)
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { outerGeometry in
            ScrollView {
                VStack(spacing: 0) {
                    
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Text(formatter.addressLine1())
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Text(formatter.addressLine2())
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                Spacer()
                            }
                            .padding(.bottom, 12)
                            
                            HStack {
                                Spacer()
                                if let url = URL(string: formatter.website()) {
                                    Link("Visit Website", destination: url)
                                }
                                Spacer()
                            }
                        }
                        .padding(.vertical, 28)
                        .padding(.horizontal, 22)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color(red: 0.955, green: 0.955, blue: 0.955)))
                    .background(RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(Color(red: 0.725, green: 0.725, blue: 0.725)))
                    
                    
                    VStack {
                        VStack {
                            HStack {
                                Spacer()
                                Text("Test Results")
                                    .font(.title)
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Text(formatter.numberOfStudents())
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                Text(formatter.criticalReading())
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Text(formatter.writing())
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                Spacer()
                            }
                            
                            HStack {
                                Spacer()
                                Text(formatter.math())
                                    .font(.title2)
                                    .foregroundColor(Color(red: 0.45, green: 0.45, blue: 0.45))
                                Spacer()
                            }
                            
                            
                        }
                        .padding(.vertical, 28)
                        .padding(.horizontal, 22)
                    }
                    .background(RoundedRectangle(cornerRadius: 10).fill().foregroundColor(Color(red: 0.955, green: 0.955, blue: 0.955)))
                    .background(RoundedRectangle(cornerRadius: 10).stroke().foregroundColor(Color(red: 0.725, green: 0.725, blue: 0.725)))
                    
                    
                }
            }
        }
        .navigationTitle(formatter.name())
    }
}
