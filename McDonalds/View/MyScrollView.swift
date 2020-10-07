//
//  MyScrollView.swift
//  McDonalds
//
//  Created by Denis on 21/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class MyScrollView: UIView {
    
    public func setScrollView(vc: UIViewController) {
        
        //fill in array
        var offerArray = [Offer]()
        setArray(&offerArray)
        
        //set up scroll view
        let myScrollView = BannerView(frame: CGRect(x: 0, y: 88, width: vc.view.frame.size.width, height: vc.view.frame.size.height - 171))
        vc.view.addSubview(myScrollView)
        
        myScrollView.reloadData(numberOfItems: offerArray.count) {[offerArray] (bannerView, index) -> (UIView) in
            
            let view = UIView(frame: bannerView.frame)
            
            //add label
            let label = UILabel(frame: CGRect(x: view.frame.origin.x + 15, y: view.frame.origin.y, width: view.frame.width - 30, height: 50))
            label.text = "Offer number \(index + 1)!"
            label.textAlignment = .center
            label.textColor = .black
            label.font = .systemFont(ofSize: 35)
            view.addSubview(label)
            
            //add offer image
            let imageView = UIImageView(frame: CGRect(x: view.frame.origin.x + 30, y: view.frame.origin.y + 80, width: view.frame.width - 60, height: view.frame.height - 160))
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: offerArray[index].imageName ?? "nil")
            view.addSubview(imageView)
            
            return view
        }
        
    }
    
    private func setArray(_ array: inout [Offer]) {
        for index in 1...6 {
            let offer = Offer(count: index, imageName: "action\(index)")
            array.append(offer)
        }
    }
    
}
