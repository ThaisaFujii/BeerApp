//
//  BeerDetailView.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 18/08/22.
//

import Foundation
import UIKit

protocol BeerDetailViewDelegate: AnyObject {
    func didTapbackButton()
}

class BeerDetailView: UIView {
    private weak var delegate:BeerDetailViewDelegate?

    func delegate(delegate:BeerDetailViewDelegate){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .black
        button.addTarget(self, action: #selector(self.didTapbackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .white
        tableview.register(BeerDetailTableViewCell.self, forCellReuseIdentifier: BeerDetailTableViewCell.identifier)
        tableview.separatorStyle = .none
        return tableview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        setupConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapbackButton(){
        delegate?.didTapbackButton()
    }
    
    func configTableViewProtocols(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func addElements() {
        addSubview(backButton)
        addSubview(tableView)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 30),
        
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
