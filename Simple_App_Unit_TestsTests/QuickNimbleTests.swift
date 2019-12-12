//
//  QuickNimbleTests.swift
//  Simple_App_Unit_TestsTests
//
//  Created by Alvaro Vinicius do Nascimento Fernandes on 04/12/19.
//  Copyright © 2019 Alvaro Vinicius do Nascimento Fernandes. All rights reserved.
//

import Quick
import Nimble

@testable import Simple_App_Unit_Tests

class QuickNimbleTests: QuickSpec {
    
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
    
    override func spec() {
        super.spec()
        
        describe("HomeInteractor") {
            beforeEach {
                let interactor = HomeInteractor()
                self.dummyHomePresenter = DummyHomePresenter()
                interactor.presenter = self.dummyHomePresenter
                self.subject = interactor
            }
            
            describe("#load") {
                context("when is perfect") {
                    it("calls perfect") {
                        self.subject.load(100, 100)
                        expect(self.dummyHomePresenter.hasCalledPerfect).to(beTrue())
                    }
                }
                context("when is too close") {
                    it("calls to cloose") {
                        self.subject.load(95, 100)
                        expect(self.dummyHomePresenter.hasCalledTooClose).to(beTrue())
                    }
                }
                context("when is not so good") {
                    it("calls not so good") {
                        self.subject.load(90, 100)
                        expect(self.dummyHomePresenter.hasCalledNotSoGood).to(beTrue())
                    }
                }
                context("when is very bad") {
                    it("calls very bad") {
                        self.subject.load(80, 100)
                        expect(self.dummyHomePresenter.hasCalledVeryBad).to(beTrue())
                    }
                }
                context("when is show error") {
                    it("calls show error") {
                        self.subject.load(0, 100)
                        expect(self.dummyHomePresenter.hasCalledShowError).to(beTrue())
                    }
                }
            }
        }
    }
}
