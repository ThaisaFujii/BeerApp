//
//  HomeCoordinator.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 17/08/22.
//

import UIKit

class BeerListCoordinator: BeerListCoordinatorProtocol {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let beerListViewController = BeerListViewController()
        beerListViewController.delegate(delegate: self)
        navigationController.pushViewController(beerListViewController, animated: true)
    }
    
    func navigateToBeerDetail(id:Int) {
        let beerDetailViewController = BeerDetailViewController()
        beerDetailViewController.beerID = id
        navigationController.pushViewController(beerDetailViewController, animated: true)
    }
}
