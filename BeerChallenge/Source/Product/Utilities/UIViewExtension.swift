//
//  UIViewExtension.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 18/08/22.
//

import UIKit
// config das bordas
extension UIView {
    
    func pint(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
