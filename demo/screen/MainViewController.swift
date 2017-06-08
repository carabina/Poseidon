//
//  MainViewController.swift
//  Poseidon
//
//  Created by Alex Motor on 08.06.17.
//  Copyright © 2017 Alex Motor. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
        
    private let oneVC = "OneViewController"
    private let twoVC = "TwoViewController"
    
    @IBAction func oneButtonAction(_ sender: Any) {
        AppDelegate.navigator.push(oneVC)
    }

    @IBAction func twoButtonAction(_ sender: Any) {
        AppDelegate.navigator.push(twoVC)
    }
    
}
