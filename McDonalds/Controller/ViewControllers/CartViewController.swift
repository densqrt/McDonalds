//
//  CartViewController.swift
//  McDonalds
//
//  Created by Denis on 24/9/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    //MARK: - Variable
    var myTableView = UITableView()
    let identifier = "myCell"
    var total = 0.0
    
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView(&myTableView, cellIdentifier: identifier)
        setNavControllerLook()
    }
}

//MARK: - Method
extension CartViewController {
    
    func createTableView(_ tableView: inout UITableView, cellIdentifier: String) {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    
    fileprivate func setNavControllerLook() {
        navigationController?.navigationBar.barTintColor = .red
        navigationItem.titleView = UIImageView(image: UIImage(named: "mcdonalds"))
        
        for item in itemArray {
            total += item.price!
        }
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Order \(String(format: "%.2f", total))", style: .done, target: self, action: #selector(confirmOrder))
        
        
    }
}

//MARK: - Action
extension CartViewController {
    
    @objc func confirmOrder() {
        let alert = UIAlertController(title: "Confirmed", message: "We'll call you soon", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
        itemArray.removeAll()
        myTableView.reloadData()
        total = 0.0
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Order \(String(format: "%.2f", total))", style: .done, target: self, action: #selector(confirmOrder))
        
        
    }
}

//MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            itemArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
        total = 0.0
        for item in itemArray {
            total += item.price!
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Order \(String(format: "%.2f", total))", style: .done, target: self, action: #selector(confirmOrder))
    }
    
}

//MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MyTableViewCell
        cell.data = itemArray[indexPath.item]
        cell.backgroundColor = .white
        
        return cell
    }
    
    
}
