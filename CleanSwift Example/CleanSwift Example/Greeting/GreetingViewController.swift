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


// protocol for ViewModel
protocol GreetingDisplayLogic: class {
    func displayGreeting(viewModel: GreetingViewModel)
}

// Controller
class GreetingViewController: UIViewController, GreetingDisplayLogic {
    
    @IBOutlet private var GreetingLabel: UITextField!
    
    /// Interactor
    var interactor: GreetingBusinessLogic?
    /// Router
    var router: (NSObjectProtocol & GreetingRoutingLogic & GreetingDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GreetingConfigurator.shared.configure(with: self)
        print("test commit 16.06.23")
        print("test commit 17.06.23")
        print("test commit 18.06.23")
        print("test commit 19.06.23")
        print("test commit 20.06.23")
        print("test commit 21.05.23")
        print("test commit 22.05.23")
        print("test commit 23.05.23")
        print("test commit 24.05.23")
        print("test commit 25.05.23")
        print("test commit 03.06.24")
        print("test commit 04.06.24")
        print("test commit 05.06.24")
        print("test commit 06.06.24")
        print("test commit 07.06.24")
        print("test commit 09.06.24")
        print("test commit 10.06.24")
        print("test commit 11.06.24")
        print("test commit 12.06.24")
        print("test commit 13.06.24")
        print("test commit 14.06.24")
        print("test commit 15.06.24")
        print("test commit 19.06.24")
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
        let request = GreetingRequest()
        interactor?.ShowGreeting(request: request)
    }
    
    func displayGreeting(viewModel: GreetingViewModel) {
        // GreetingLabel.text = viewModel.name
    }
    
    @IBAction func showGreetingPressed() {
        
    }
    // MARK: Setup
    
}
