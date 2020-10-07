//
//  SetUpForSubViewController.swift
//  McDonalds
//
//  Created by Denis on 22/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class SetUpForSubViewController: MenuViewController {
    
    override public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var selected = Order()
        selected.imageName = menuArray[indexPath.item].imageName
        selected.name = menuArray[indexPath.item].name
        if let name = menuArray[indexPath.item].name {
            if name.contains("1") {
                selected.price = 1.20
            } else if name.contains("2") {
                selected.price = 1.50
            } else if name.contains("3") {
                selected.price = 1.70
            } else if name.contains("4") {
                selected.price = 1.90
            } else if name.contains("5") {
                selected.price = 2.15
            } else if name.contains("6") {
                selected.price = 2.50
            } else if name.contains("7") {
                selected.price = 3.20
            }
        }
        
        let vc = OrderViewController()
        vc.data = selected
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
