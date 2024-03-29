//
//  HomePresenter.swift
//  Simple_App_Unit_Tests
//
//  Created by Alvaro Vinicius do Nascimento Fernandes on 03/12/19.
//  Copyright (c) 2019 Alvaro Vinicius do Nascimento Fernandes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
// This tag below is used to create the testable files from the Cuckoo pod
// CUCKOO_TESTABLE

import UIKit

protocol HomePresentationLogic {
    func perfect()
    func tooClose()
    func notSoGood()
    func veryBad()
    func showError()
}

class HomePresenter: HomePresentationLogic {
    
    weak var viewController: HomeDisplayLogic?
    
    func perfect() {
        viewController?.perfect()
    }
    
    func tooClose() {
        viewController?.tooClose()
    }
    
    func notSoGood() {
        viewController?.notSoGood()
    }
    
    func veryBad() {
        viewController?.notSoGood()
    }
    
    func showError() {
        viewController?.showError()
    }

}
