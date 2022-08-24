//
//  HomeViewController.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 17/08/22.
//

import UIKit

protocol BeerListCoordinatorProtocol: AnyObject {
    func navigateToBeerDetail(id:Int)
}

class BeerListViewController: UIViewController {
    let viewModel: BeerListViewModel = BeerListViewModel()
    var beerListView: BeerListView?
    var delegate: BeerListCoordinatorProtocol?
    var cell: BeerListTableViewCell = BeerListTableViewCell()
    
    func delegate(delegate:BeerListCoordinatorProtocol){
        self.delegate = delegate
    }
    
    override func loadView() {
        beerListView = BeerListView()
        view = beerListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beerListView?.configTableViewProtocols(delegate: self, dataSource: self)
        viewModel.getBeerRequest()
        viewModel.delegate(delegate: self)
        beerListView?.backgroundColor = .white
        configGestureRecognizer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func configGestureRecognizer(){
        let tapRegister = UITapGestureRecognizer(target: self, action: #selector(navigateBeerDetail))
        tapRegister.numberOfTapsRequired = 1
        cell.view.addGestureRecognizer(tapRegister)
    }
    
    @objc func navigateBeerDetail(indexPath: IndexPath) {
        delegate?.navigateToBeerDetail(id: indexPath.row + 1)
    }
    
}

extension BeerListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       navigateBeerDetail(indexPath: indexPath)
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
        let alert = UIAlertController(title: "Ops!", message: "Algo deu errado", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tente novamente", style: .default))
        DispatchQueue.main.async {
            self.present(alert, animated: true) {
                self.viewModel.getBeerRequest()
            }
        }
    }
}
