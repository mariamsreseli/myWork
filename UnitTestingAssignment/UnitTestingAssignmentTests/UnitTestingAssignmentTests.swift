//
//  UnitTestingAssignmentTests.swift
//  UnitTestingAssignmentTests
//
//  Created by Mariam Sreseli on 5/13/24.
//

import XCTest

@testable import UnitTestingAssignment

class UnitTestingAssignmentTests: XCTestCase {
    
    var cartViewModel: CartViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        cartViewModel = CartViewModel()
    }
    
    override func tearDownWithError() throws {
        cartViewModel = nil
        try super.tearDownWithError()
    }
    
    func testExample() throws {
    }
    
    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func testAddProduct() {
        let product = Product(id: 1, title: "Product 1", price: 1.0, selectedQuantity: 1)
        cartViewModel.addProduct(product: product)
        
        XCTAssertTrue(cartViewModel.selectedProducts.contains(where: { $0.id == product.id }))
    }
    
    func testRemoveProduct() {
        let product = Product(id: 2, title: "Product 2", price: 2.0, selectedQuantity: 1)
        cartViewModel.addProduct(product: product)
        
        cartViewModel.removeProduct(withID: 2)
        
        XCTAssertFalse(cartViewModel.selectedProducts.contains(where: { $0.id == 2 }))
    }
    
    func testItemsQuantity() {
        let product1 = Product(id: 3, title: "Product 3", price: 3.0, selectedQuantity: 2)
        let product2 = Product(id: 4, title: "Product 4", price: 4.0, selectedQuantity: 3)
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        
        XCTAssertEqual(cartViewModel.selectedItemsQuantity, 5)
    }
    
    func testClearCart() {
        
        let product1 = Product(id: 5, title: "Product 5", price: 5.0, selectedQuantity: 1)
        let product2 = Product(id: 6, title: "Product 6", price: 6.0, selectedQuantity: 1)
        let product3 = Product(id: 7, title: "Product 7", price: 7.0, selectedQuantity: 1)
        
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        cartViewModel.addProduct(product: product3)
        
        cartViewModel.clearCart()
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
    
    func testTotalPrice() {
        let product1 = Product(id: 8, title: "Product 8", price: 8.0, selectedQuantity: 2)
        let product2 = Product(id: 9, title: "Product 9", price: 9.0, selectedQuantity: 2)
        cartViewModel.addProduct(product: product1)
        cartViewModel.addProduct(product: product2)
        
        XCTAssertEqual(cartViewModel.totalPrice, 34.0)
    }
    
    func testAddProductWithID() {
        cartViewModel.addProduct(withID: 1)
        
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
    
    func testAddProductWithInvalidID() {
        cartViewModel.addProduct(withID: 80)
        
        XCTAssertTrue(cartViewModel.selectedProducts.isEmpty)
    }
}

