//
//  HomeViewModel.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 17/08/22.
//

import UIKit

protocol BeerListViewModelDelegate: AnyObject {
    func success()
    func error()
}

class BeerListViewModel {
    private weak var delegate: BeerListViewModelDelegate?
    let url = "https://api.punkapi.com/v2/beers"
    public func delegate(delegate:BeerListViewModelDelegate){
        self.delegate = delegate
    }
    let urlService = BeerService()
  
    var beerList: [BeerElement] = []
    
    public func getBeerRequest(){
        urlService.getData(from: url) { result, failure in
            if let result = result {
                self.beerList = result
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }
    
    public var numberOfRows: Int {
        return beerList.count
    }
}
