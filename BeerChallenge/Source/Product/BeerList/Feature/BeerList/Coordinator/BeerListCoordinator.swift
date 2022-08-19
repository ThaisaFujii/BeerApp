//
//  HomeCoordinator.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 17/08/22.
//

import UIKit

class BeerListCoordinator {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let beerListViewController = BeerListViewController()
        navigationController.pushViewController(beerListViewController, animated: true)
    }
}
