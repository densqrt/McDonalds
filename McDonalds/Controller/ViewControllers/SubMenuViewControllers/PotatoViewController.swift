//
//  PotatoViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class PotatoViewController: SetUpForSubViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["Potato_1", "Potato_2"]
        setCollectionView(cv: &myCollectionView)
        
    }
    
}
