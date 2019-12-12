//
//  HomeViewController.swift
//  Simple_App_Unit_Tests
//
//  Created by Alvaro Vinicius do Nascimento Fernandes on 03/12/19.
//  Copyright (c) 2019 Alvaro Vinicius do Nascimento Fernandes. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeDisplayLogic: class {
    func perfect()
    func tooClose()
    func notSoGood()
    func veryBad()
    func showError()
    func start()
}

class HomeViewController: UIViewController {

    var interactor: HomeBusinessLogic?
    var router: (HomeRoutingLogic & HomeDataPassing)?
    var target: Int = 0

    @IBOutlet weak var sliderComp: UISlider!
    @IBOutlet weak var value: UILabel!
    
    init() {
        super.init(nibName: "HomeViewController", bundle: Bundle(for: HomeViewController.self))
        setup()
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.viewController = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        start()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        interactor?.load(Int(sliderComp?.value ?? 0.0), target)
        start()
    }
    
    func start() {
        target = interactor?.getValue ?? 0
        value.text = String(target)
        sliderComp.value = 50.0
    }
    
}

extension HomeViewController: HomeDisplayLogic {
    func perfect() {
        router?.perfect()
    }
    
    func tooClose() {
        router?.tooClose()
    }
    
    func notSoGood() {
        router?.notSoGood()
    }
    
    func veryBad() {
        router?.veryBad()
    }
    
    func showError() {
        router?.showError()
    }

}