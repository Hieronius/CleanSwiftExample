//
//  GreetingWorker.swift
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

// Module builder
class GreetingConfigurator {
    static let shared = GreetingConfigurator()
    func configure(with viewController: GreetingViewController) {
        let viewController = viewController
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
