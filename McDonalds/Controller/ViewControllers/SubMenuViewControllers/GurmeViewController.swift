//
//  GurmeViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class GurmeViewController: SetUpForSubViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["Gurme_1", "Gurme_2", "Gurme_3"]
        setCollectionView(cv: &myCollectionView)
        
    }
    
}
