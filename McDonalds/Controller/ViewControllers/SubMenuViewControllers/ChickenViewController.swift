//
//  ChickenViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ChickenViewController: SetUpForSubViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["Chicken_1", "Chicken_2", "Chicken_3", "Chicken_4", "Chicken_5", "Chicken_6"]
        setCollectionView(cv: &myCollectionView)
        
    }
    
}
