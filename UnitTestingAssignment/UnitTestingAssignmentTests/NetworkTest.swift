//
//  NetworkTest.swift
//  UnitTestingAssignmentTests
//
//  Created by Mariam Sreseli on 5/13/24.
//

//import XCTest
//@testable import UnitTestingAssignment
//
//class NetworkTest: XCTestCase {
//
//    var NetworkManager: NetworkManager!
//
//    override func setUpWithError() throws {
//        
//    }
//
//    override func tearDownWithError() throws {
//       
//    }
//
//    func testExample() throws {
//      
//    }
//
//    func testPerformanceExample() throws {
//        
//        self.measure {
//            
//        }
//    }
//    
//    func testFetchProducts() {
//            let expectation = XCTestExpectation(description: "Fetch products")
//
//        NetworkManager.shared.fetchProducts { result in
//                switch result {
//                case .success(let products):
//                    XCTAssertNotNil(products)
//                    expectation.fulfill()
//                case .failure(_):
//                    XCTFail("Error")
//                }
//            }
//
//            wait(for: [expectation], timeout: 10)
//        }
//
//    func testFetchProductsFailure() {
//            let expectation = XCTestExpectation(description: "Fetch products failure")
//
//            // Mocking a failing network request by providing an invalid URL
//            NetworkManager.shared.fetchProducts(urlString: "invalid_url") { result in
//                if case .failure = result {
//                    expectation.fulfill()
//                } else {
//                    XCTFail("Fetch should fail with invalid URL")
//                }
//            }
//
//            wait(for: [expectation], timeout: 10)
//        }
//}

import XCTest

@testable import UnitTestingAssignment

class NetworkManagerTests: XCTestCase {
    
    func testFetchProductsSuccess() {
        let expectation = XCTestExpectation(description: "Fetch products success")
        
        NetworkManager.shared.fetchProducts { result in
            if case .success = result {
                expectation.fulfill()
            } else {
                XCTFail("Fetch should succeed")
            }
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
