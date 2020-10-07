//
//  MyTableViewCell.swift
//  McDonalds
//
//  Created by Denis on 24/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

open class MyTableViewCell: UITableViewCell {
    
    fileprivate let myImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    fileprivate let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    fileprivate let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var data: Order? {
        didSet {
            guard let data = data else { return }
            myImageView.image = UIImage(named: data.imageName ?? "nil")
            nameLabel.text = data.name
            priceLabel.text = String(format: "%.2f", data.price!)
        }
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        
        myImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        myImageView.widthAnchor.constraint(equalTo: myImageView.heightAnchor).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        nameLabel.heightAnchor.constraint(equalTo: myImageView.heightAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor).isActive = true
        
        priceLabel.heightAnchor.constraint(equalTo: myImageView.heightAnchor).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
