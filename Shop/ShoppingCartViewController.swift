//
//  ShoppingCartViewController.swift
//  Shop
//
//  Created by Pragathi Kallu on 9/24/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import SAPCommon
import SAPFiori
import SAPOData
import SAPFoundation


class ShoppingCartViewController: UIViewController {
    let logger = Logger.shared(named: "ShoppingCartViewController");

    @IBOutlet var workList: WorklistView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapClose(_ sender: Any) {
        dismiss(animated: true)
    }
    

}
