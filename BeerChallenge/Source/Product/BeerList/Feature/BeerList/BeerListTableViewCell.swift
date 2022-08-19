//
//  BeerListTableViewCell.swift
//  BeerChallenge
//
//  Created by Thaisa Fujii on 18/08/22.
//

import UIKit
import AlamofireImage

class BeerListTableViewCell: UITableViewCell {

    static let identifier = "BeerListTableViewCell"
    
    lazy var imageCellView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var imageTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        return title
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(imageCellView)
        addSubview(imageTitle)
        setupConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(data:BeerElement) {
        imageTitle.text = data.name
        let url = URL(string: data.imageURL) ?? URL(fileURLWithPath: "")
        imageCellView.af.setImage(withURL: url)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            imageCellView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            imageCellView.heightAnchor.constraint(equalToConstant: 80),
            imageCellView.widthAnchor.constraint(equalTo: imageCellView.heightAnchor, multiplier: 16/9),
            
            imageTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageTitle.leadingAnchor.constraint(equalTo: imageCellView.trailingAnchor, constant: 12),
            imageTitle.heightAnchor.constraint(equalToConstant: 80),
            imageTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
