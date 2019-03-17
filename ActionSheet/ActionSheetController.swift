//
//  ActionSheetController.swift
//  ActionSheet
//
//  Created by Roger Prats on 17/03/2019.
//  Copyright © 2019 Roger Prats. All rights reserved.
//

import UIKit

class ActionSheetController: UIViewController {
    override func viewDidLoad() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 10
        tableView.backgroundColor = #colorLiteral(red: 0.1040944532, green: 0.1451746821, blue: 0.1742847562, alpha: 1)
        view.addSubview(tableView)
        
        let cancelButton = UIButton(type: .system)
        cancelButton.backgroundColor = #colorLiteral(red: 0.1040944532, green: 0.1451746821, blue: 0.1742847562, alpha: 1)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.layer.cornerRadius = 10
        view.addSubview(cancelButton)
        
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            
            cancelButton.heightAnchor.constraint(equalToConstant: 45),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            cancelButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            cancelButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 16)])
    }
}
