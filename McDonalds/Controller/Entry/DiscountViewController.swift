//
//  DiscountViewController.swift
//  McDonalds
//
//  Created by Denis on 20/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

open class DiscountViewController: UIViewController {
    
    //MARK: - viewDidLoad
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavControllerLook()
        MyScrollView().setScrollView(vc: self)
    }
    
}

//MARK: - Method
extension DiscountViewController {
    
    fileprivate func setNavControllerLook() {
        navigationController?.navigationBar.barTintColor = .red
        navigationItem.titleView = UIImageView(image: UIImage(named: "mcdonalds"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(goToCart))
    }
}

//MARK: - Action
extension DiscountViewController {
    
    @objc func goToCart() {
        
        navigationController?.pushViewController(CartViewController(), animated: true)
    }
    
}
