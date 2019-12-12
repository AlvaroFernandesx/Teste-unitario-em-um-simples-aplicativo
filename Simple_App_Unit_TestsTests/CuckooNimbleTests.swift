//
//  CuckooNimbleTests.swift
//  Simple_App_Unit_TestsTests
//
//  Created by Alvaro Vinicius do Nascimento Fernandes on 04/12/19.
//  Copyright © 2019 Alvaro Vinicius do Nascimento Fernandes. All rights reserved.
//

import Cuckoo
import Nimble
import XCTest

@testable import Simple_App_Unit_Tests

class CuckooNimbleTests: XCTestCase {
    
    var subject: HomeInteractor!
    var mockPresenter: MockHomePresenter!
    
    override func setUp() {
        let interactor = HomeInteractor()
        self.mockPresenter = MockHomePresenter()
        interactor.presenter = self.mockPresenter
        self.subject = interactor
    }
    
    func test_load_when_is_perfect() {
        stub(mockPresenter) { (stub) in
            when(stub.perfect()).thenDoNothing()
        }
        subject.load(100, 100)
        verify(mockPresenter).perfect()
    }
    
    func test_load_when_is_too_close() {
        stub(mockPresenter) { (stub) in
            when(stub.tooClose()).thenDoNothing()
        }
        subject.load(96, 100)
        verify(mockPresenter).tooClose()
    }
    
    func test_load_when_is_not_so_good() {
        stub(mockPresenter) { (stub) in
            when(stub.notSoGood()).thenDoNothing()
        }
        subject.load(90, 100)
        verify(mockPresenter).notSoGood()
    }
    
    func test_load_when_is_very_bad() {
        stub(mockPresenter) { (stub) in
            when(stub.veryBad()).thenDoNothing()
        }
        subject.load(80, 100)
        verify(mockPresenter).veryBad()
    }
    
    func test_load_when_is_show_error() {
        stub(mockPresenter) { (stub) in
            when(stub.showError()).thenDoNothing()
        }
        subject.load(0, 100)
        verify(mockPresenter).showError()
    }

}
