//
//  _20822_SoldierWilliamsNYCTests.swift
//  120822-SoldierWilliamsNYCTests
//
//  Created by Soldier Williams on 12/8/22.
//

import XCTest
@testable import _20822_SoldierWilliamsNYC

final class _20822_SoldierWilliamsNYCTests: XCTestCase {

    func testSchools() {
        let expectation = XCTestExpectation(description: "Download data expectation.")
        let viewModel = ViewModel()
        viewModel.fetchSchools()
        DispatchQueue.global(qos: .background).async {
            Thread.sleep(forTimeInterval: 10)
            if viewModel.schools.count > 0 {
                expectation.fulfill()
            } else {
                XCTFail("No schools found")
            }
        }
        wait(for: [expectation], timeout: 15.0)
    }

}
