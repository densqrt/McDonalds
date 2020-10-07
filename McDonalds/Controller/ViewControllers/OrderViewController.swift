//
//  OrderViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    //MARK: - Variable
    fileprivate let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    fileprivate let myLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    fileprivate let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    fileprivate let minusButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        
        return button
    }()
    
    fileprivate let plusButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    fileprivate let ammountLabel: UILabel = {
        
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    fileprivate let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Order", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 30
        
        return button
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavControllerLook()
        
        view.addSubview(myImageView)
        view.addSubview(myLabel)
        view.addSubview(priceLabel)
        view.addSubview(minusButton)
        view.addSubview(ammountLabel)
        view.addSubview(plusButton)
        view.addSubview(orderButton)
        
        setConstraints()
        addButtonTargets()
    }
    
    var data: Order? {
        didSet {
            guard let data = data else { return }
            myImageView.image = UIImage(named: data.imageName ?? "nil")
            myLabel.text = data.name
            priceLabel.text = "Price for one: \(String(format: "%.2f", data.price ?? 10.00)) BYN"
        }
    }
}

//MARK: - Method
extension OrderViewController {
    
    private func setConstraints() {
        
        myLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        myLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        myImageView.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 5).isActive = true
        myImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 15).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        ammountLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15).isActive = true
        ammountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        ammountLabel.widthAnchor.constraint(equalToConstant: 25).isActive = true
        ammountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        minusButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        minusButton.leadingAnchor.constraint(equalTo: ammountLabel.trailingAnchor, constant: -50).isActive = true
        minusButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        plusButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        plusButton.trailingAnchor.constraint(equalTo: ammountLabel.leadingAnchor, constant: 50).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        orderButton.topAnchor.constraint(equalTo: ammountLabel.bottomAnchor, constant: 30).isActive = true
        orderButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        orderButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        orderButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        orderButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70).isActive = true
        
    }
    
    private func addButtonTargets() {
        minusButton.addTarget(self, action: #selector(minus), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
        orderButton.addTarget(self, action: #selector(order), for: .touchUpInside)
        
    }
    
    fileprivate func setNavControllerLook() {
        navigationController?.navigationBar.barTintColor = .red
        navigationItem.titleView = UIImageView(image: UIImage(named: "mcdonalds"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(goToCart))
    }
    
}

//MARK: - Action
extension OrderViewController {
    
    @objc func goToCart() {
        
        navigationController?.pushViewController(CartViewController(), animated: true)
    }
    
    @objc func minus() {
        if var num = Int(ammountLabel.text!) {
            if num > 1 {
                num -= 1
                ammountLabel.text = "\(num)"
                let price = Double(num) * (data?.price)!
                orderButton.setTitle("Add to cart \(String(format: "%.2f", price)) BYN", for: .normal)
            } else if num > 0 {
                num -= 1
                ammountLabel.text = "\(num)"
                orderButton.setTitle("Order", for: .normal)
                minusButton.isHidden = true
            }
        }
    }
    
    @objc func plus() {
        if var num = Int(ammountLabel.text!) {
            num += 1
            ammountLabel.text = "\(num)"
            minusButton.isHidden = false
            let price = Double(num) * (data?.price)!
            orderButton.setTitle("Add to cart \(String(format: "%.2f", price)) BYN", for: .normal)
        }
    }
    
    @objc func order() {
        if Int(ammountLabel.text!) != 0 {
        
            var newItem = Order()
            
            newItem.imageName = data?.imageName
            newItem.name = data?.name
            
            let price = Double(Int(ammountLabel.text!)!) * (data?.price)!
            newItem.price = price
            itemArray.append(newItem)
        
        }
    }
    
}
