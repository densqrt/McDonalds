//
//  MyCollectionViewCell.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    fileprivate let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    fileprivate let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var data: Menu? {
        didSet {
            guard let data = data  else { return }
            myLabel.text = data.name
            myImageView.image = UIImage(named: data.imageName ?? "nil")
            
        }
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        
        myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        myImageView.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 5).isActive = true
        myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
