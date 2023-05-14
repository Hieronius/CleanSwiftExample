//
//  GreetingViewController.swift
//  CleanSwift Example
//
//  Created by Арсентий Халимовский on 14.05.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol GreetingDisplayLogic: class {
    func displaySomething(viewModel: Greeting.Something.ViewModel)
}

class GreetingViewController: UIViewController, GreetingDisplayLogic {
    
    //@IBOutlet private var nameTextField: UITextField!
    
    var interactor: GreetingBusinessLogic?
    var router: (NSObjectProtocol & GreetingRoutingLogic & GreetingDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = Greeting.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Greeting.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = GreetingInteractor()
        let presenter = GreetingPresenter()
        let router = GreetingRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
