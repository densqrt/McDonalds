//
//  SaladViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class SaladViewController: SetUpForSubViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["Salad_1", "Salad_2"]
        setCollectionView(cv: &myCollectionView)
        
    }
    
}
