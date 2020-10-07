//
//  BeafViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class BeafViewController: SetUpForSubViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["Beaf_1", "Beaf_2", "Beaf_3", "Beaf_4", "Beaf_5", "Beaf_6", "Beaf_7"]
        setCollectionView(cv: &myCollectionView)
        
    }
    
}
