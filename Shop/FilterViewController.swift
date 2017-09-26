//
//  FilterViewController.swift
//  Shop
//
//  Created by Pragathi Kallu on 9/26/17.
//  Copyright © 2017 SAP. All rights reserved.
//

import UIKit
import SAPFiori

class FilterViewController: FUIFormTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func applyFilter(_ sender: Any) {
    }
    @IBAction func cancelFilter(_ sender: Any) {
        dismiss(animated: true)
    }
}
