//
//  BeerDetailViewModel.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 18/08/22.
//

import Foundation

protocol BeerDetailViewModelDelegate: AnyObject {
    func success()
    func error()
}

class BeerDetailViewModel {
    private weak var delegate: BeerDetailViewModelDelegate?
    
    public func delegate(delegate: BeerDetailViewModelDelegate){
        self.delegate = delegate
    }
    let urlService = BeerService()
    let url = "https://api.punkapi.com/v2/beers"
    var beerDetail: [BeerElement] = []
    
    public func getBeerRequest(id:String){
        urlService.getData(from: "\(url)/\(id)") { result, failure in
            if let result = result {
                self.beerDetail = result
                self.delegate?.success()
            } else {
                self.delegate?.error()
            }
        }
    }
    
    public var numberOfRows: Int {
        return beerDetail.count
    }
}
