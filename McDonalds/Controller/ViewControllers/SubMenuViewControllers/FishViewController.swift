//
//  FishViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class FishViewController: SetUpForSubViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = ["Fish_1", "Fish_2", "Fish_3", "Fish_4", "Fish_5"]
        setCollectionView(cv: &myCollectionView)
        
    }
    
}
