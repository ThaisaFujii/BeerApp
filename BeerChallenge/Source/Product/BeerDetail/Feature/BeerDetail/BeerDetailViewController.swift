//
//  BeerDetailViewController.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 18/08/22.
// 

import UIKit

class BeerDetailViewController: UIViewController {
    let viewModel = BeerDetailViewModel()
    var beerDetailView: BeerDetailView?
    var beerID: Int = 0
//    var beername = ""
    
    override func loadView() {
        beerDetailView = BeerDetailView()
        view = beerDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beerDetailView?.configTableViewProtocols(delegate: self, dataSource: self)
        beerDetailView?.delegate(delegate: self)
        viewModel.getBeerRequest(id: String(beerID))
        viewModel.delegate(delegate: self)
    }

}

extension BeerDetailViewController: BeerDetailViewDelegate {
    func didTapbackButton() {
        navigationController?.popViewController(animated: true)
    }
}

extension BeerDetailViewController: UITableViewDelegate {}

extension BeerDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerDetailTableViewCell.identifier, for: indexPath) as? BeerDetailTableViewCell
        cell?.setupCell(data: viewModel.beerDetail[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension BeerDetailViewController: BeerDetailViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.beerDetailView?.tableView.reloadData()
        }
    }
    
    func error() {
        print("Deu ruim")
    }
}
