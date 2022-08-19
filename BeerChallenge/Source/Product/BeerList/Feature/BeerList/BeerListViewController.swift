//
//  HomeViewController.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 17/08/22.
//

import UIKit

class BeerListViewController: UIViewController {
    let viewModel: BeerListViewModel = BeerListViewModel()
    var beerListView: BeerListView?
    
    override func loadView() {
        beerListView = BeerListView()
        view = beerListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beerListView?.configTableViewProtocols(delegate: self, dataSource: self)
        viewModel.getBeerRequest()
        viewModel.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension BeerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: BeerDetailViewController = BeerDetailViewController()
        vc.beerID = indexPath.row + 1
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension BeerListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerListTableViewCell.identifier, for: indexPath) as? BeerListTableViewCell
        cell?.setupCell(data: viewModel.beerList[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension BeerListViewController: BeerListViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.beerListView?.tableView.reloadData()
        }
    }
    
    func error() {
        print("Deu ruim")
    }
}
