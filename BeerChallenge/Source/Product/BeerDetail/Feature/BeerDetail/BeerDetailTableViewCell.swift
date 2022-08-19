//
//  BeerDetailTableViewCell.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 18/08/22.
//

import UIKit
import AlamofireImage

class BeerDetailTableViewCell: UITableViewCell {
    static let identifier = "BeerDetailTableViewCell"
    var arrayOfMalts:[String] = []
    
    lazy var imageBeer: UIImageView = {
        var beerImage = UIImageView()
        beerImage.translatesAutoresizingMaskIntoConstraints = false
        beerImage.contentMode = .scaleAspectFit
        return beerImage
    }()
    
    
    lazy var beerName: UILabel = {
        var subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textAlignment = .center
        subtitle.numberOfLines = 0
        subtitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return subtitle
    }()
    
    lazy var subTitle: UILabel = {
        var subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textAlignment = .center
        subtitle.textColor = UIColor(named: "subtitleColor")
        subtitle.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return subtitle
    }()
    
    lazy var labelDescription: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Description:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    lazy var beerDescription: UILabel = {
        var description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .left
        description.numberOfLines = 0
        description.textColor = .darkGray
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return description
    }()
    
    lazy var labelIngredients: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Malt Ingredients:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    lazy var ingredientsDescription: UILabel = {
        var description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.textAlignment = .left
        description.textColor = .darkGray
        description.numberOfLines = 0
        description.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return description
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        setupConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getMalt(data:BeerElement) {
        for malt in data.ingredients.malt {
            arrayOfMalts.append(malt.name)
        }
    }
    
    func setupCell(data:BeerElement) {
        getMalt(data: data)
        let url = URL(string: data.imageURL) ?? URL(fileURLWithPath: "")
        imageBeer.af.setImage(withURL: url)
        subTitle.text = data.tagline
        beerDescription.text = data.beerDescription
        let typesOfMalts = arrayOfMalts.joined(separator: ", ")
        ingredientsDescription.text = typesOfMalts
        beerName.text = data.name
    }
    
    func addElements(){
        contentView.addSubview(imageBeer)
        contentView.addSubview(beerName)
        contentView.addSubview(subTitle)
        contentView.addSubview(labelDescription)
        contentView.addSubview(beerDescription)
        contentView.addSubview(labelIngredients)
        contentView.addSubview(ingredientsDescription)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageBeer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            imageBeer.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageBeer.heightAnchor.constraint(equalToConstant: 80),
            imageBeer.widthAnchor.constraint(equalTo: imageBeer.heightAnchor, multiplier: 16/9),
            
            beerName.topAnchor.constraint(equalTo: imageBeer.bottomAnchor, constant: 10),
            beerName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            beerName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            subTitle.topAnchor.constraint(equalTo: beerName.bottomAnchor, constant: 10),
            subTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            subTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            labelDescription.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            labelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            beerDescription.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 10),
            beerDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            beerDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            labelIngredients.topAnchor.constraint(equalTo: beerDescription.bottomAnchor, constant: 10),
            labelIngredients.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            labelIngredients.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            ingredientsDescription.topAnchor.constraint(equalTo: labelIngredients.bottomAnchor, constant: 10),
            ingredientsDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ingredientsDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
