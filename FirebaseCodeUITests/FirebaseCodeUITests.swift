//
//  FirebaseCodeUITests.swift
//  FirebaseCodeUITests
//
//  Created by Mohamad Shawal Sapuan Bin Mohamad on 17/01/2025.
//

import XCTest

final class FirebaseCodeUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testLogin() throws {
        let app = XCUIApplication()
        
        let landingScreen = app.otherElements["landingScreen"]
        waitForElementToAppear(element: landingScreen, withTimeout: 10.0)
        
        let landingLoginButton = app.buttons["landing_login_button"]
        waitForElementToAppear(element: landingLoginButton, withTimeout: 10.0)
        landingLoginButton.tap()
        
        let loginScreen = app.otherElements["loginScreen"]
        waitForElementToAppear(element: loginScreen, withTimeout: 10.0)
        
        let emailTextField = app.textFields["login_email"]
        waitForElementToAppear(element: emailTextField, withTimeout: 10.0)
        emailTextField.tap()
        emailTextField.typeText("a@b.com")
        
        let passwordTextField = app.secureTextFields["login_password"]
        waitForElementToAppear(element: passwordTextField, withTimeout: 10.0)
        passwordTextField.tap()
        passwordTextField.typeText("test123")
        
        let loginButton = app.buttons["login_button"]
        waitForElementToAppear(element: loginButton, withTimeout: 10.0)
        loginButton.tap()
        
        let homeScreen = app.otherElements["homeScreen"]
        waitForElementToAppear(element: homeScreen, withTimeout: 10.0)
    }
    
    func waitForElementToAppear(element: XCUIElement, withTimeout: TimeInterval) {
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: element)
        waitForExpectations(timeout: withTimeout) { error in
            if error != nil {
                XCTFail("Failed to find \(element) after \(withTimeout) seconds")
            }
        }
    }
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
