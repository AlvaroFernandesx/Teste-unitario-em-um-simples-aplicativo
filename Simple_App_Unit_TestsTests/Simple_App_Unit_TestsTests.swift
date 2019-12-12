//
//  Simple_App_Unit_TestsTests.swift
//  Simple_App_Unit_TestsTests
//
//  Created by Alvaro Vinicius do Nascimento Fernandes on 03/12/19.
//  Copyright © 2019 Alvaro Vinicius do Nascimento Fernandes. All rights reserved.
//

import XCTest
@testable import Simple_App_Unit_Tests

class Simple_App_Unit_TestsTests: XCTestCase {
    
    class DummyHomePresenter: HomePresentationLogic {

        var hasCalledShowError = false
        var hasCalledVeryBad = false
        var hasCalledNotSoGood = false
        var hasCalledTooClose = false
        var hasCalledPerfect = false
        
        func showError() { hasCalledShowError = true }
        func veryBad() { hasCalledVeryBad = true }
        func notSoGood() { hasCalledNotSoGood = true }
        func tooClose() { hasCalledTooClose = true }
        func perfect() { hasCalledPerfect = true }
    }
    
    var subject: HomeInteractor!
    var dummyHomePresenter: DummyHomePresenter!
    
    override func setUp() {
        let interactor = HomeInteractor()
        self.dummyHomePresenter = DummyHomePresenter()
        interactor.presenter = self.dummyHomePresenter
        self.subject = interactor
    }
    
    func test_load_when_is_perfect() {
        subject.load(100, 100)
        XCTAssertTrue(dummyHomePresenter.hasCalledPerfect)
    }
    
    func  test_load_when_is_too_close() {
        subject.load(96, 100)
        XCTAssertTrue(dummyHomePresenter.hasCalledTooClose)
    }
    
    func teste_load_when_is_not_soo_good() {
        subject.load(90, 100)
        XCTAssertTrue(dummyHomePresenter.hasCalledNotSoGood)
    }
    
    func test_load_when_is_very_bad() {
        subject.load(50, 100)
        XCTAssertTrue(dummyHomePresenter.hasCalledVeryBad)
    }
    
    func test_load_when_is_show_error() {
        subject.load(0, 100)
        XCTAssertTrue(dummyHomePresenter.hasCalledShowError)
    }
    
}
