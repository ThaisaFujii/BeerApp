//
//  HomeView.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 17/08/22.
//

import UIKit

class BeerListView: UIView {
    lazy var tableView: UITableView = {
     let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(BeerListTableViewCell.self, forCellReuseIdentifier: BeerListTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func addElements() {
        addSubview(tableView)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

