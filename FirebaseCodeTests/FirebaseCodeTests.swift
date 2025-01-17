//
//  FirebaseCodeTests.swift
//  FirebaseCodeTests
//
//  Created by Mohamad Shawal Sapuan Bin Mohamad on 17/01/2025.
//

import XCTest
import FirebaseAuth
@testable import FirebaseCode

final class FirebaseCodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLogin() throws {
        print("test login called")
        
        let expectSuccess = XCTestExpectation(description: "Login Success")
        Auth.auth().signIn(withEmail: "a@b.com", password: "test123") { authResult, error in
            if let e = error {
                print(e.localizedDescription)
                print("test failed")
            } else {
                print("test success")
                expectSuccess.fulfill()
            }
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
