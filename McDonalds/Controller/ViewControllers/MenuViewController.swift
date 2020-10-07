//
//  MenuViewController.swift
//  McDonalds
//
//  Created by Denis on 20/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

open class MenuViewController: UIViewController {
    
    //MARK: - Variable
    var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        return cv
    }()
    
    var imageArray = ["Beaf", "Chicken", "Fish", "Gurme", "Potato", "Salad"]
    
    lazy var menuArray: [Menu] = {
        var tempArray = [Menu]()

        for name in imageArray {
            let item = Menu(name: name, imageName: name)
            tempArray.append(item)
        }
        return tempArray
    }()
    
    //MARK: - viewDidLoad
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavControllerLook()
        setCollectionView(cv: &myCollectionView)
    }
}

//MARK: - Method
extension MenuViewController {
    
    func setCollectionView(cv: inout UICollectionView) {
        
        view.addSubview(cv)
        cv.backgroundColor = .white
        
        cv.dataSource = self
        cv.delegate = self
        
        cv.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        cv.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90).isActive = true
        cv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        cv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
    }
    
    fileprivate func setNavControllerLook() {
           navigationController?.navigationBar.barTintColor = .red
           navigationItem.titleView = UIImageView(image: UIImage(named: "mcdonalds"))
           navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(goToCart))
       }
}


//MARK: - Action
extension MenuViewController {
    
    @objc func goToCart() {
        
        navigationController?.pushViewController(CartViewController(), animated: true)
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.width / 2.1, height: myCollectionView.frame.height / 2)
    }
}

//MARK: - UICollectionViewDelegate
extension MenuViewController: UICollectionViewDelegate {
   
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch menuArray[indexPath.item].name {
        case "Beaf":
            navigationController?.pushViewController(BeafViewController(), animated: true)
        case "Chicken":
            navigationController?.pushViewController(ChickenViewController(), animated: true)
        case "Fish":
            navigationController?.pushViewController(FishViewController(), animated: true)
        case "Potato":
            navigationController?.pushViewController(PotatoViewController(), animated: true)
        case "Gurme":
            navigationController?.pushViewController(GurmeViewController(), animated: true)
        case "Salad":
            navigationController?.pushViewController(SaladViewController(), animated: true)
        default:
            break
        }
    }
}

//MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        cell.data = menuArray[indexPath.item]
        return cell
    }
    
    
}
