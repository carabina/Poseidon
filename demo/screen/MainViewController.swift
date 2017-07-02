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
    private let threeVC = "ThreeViewController"
    
    @IBAction func oneButtonAction(_ sender: Any) {
        AppDelegate.navigator.push(oneVC)
    }

    @IBAction func twoButtonAction(_ sender: Any) {
        AppDelegate.navigator.show(twoVC)
    }
    
    @IBAction func threeButtonAction(_ sender: Any) {
        AppDelegate.navigator.set(threeVC)
    }
    
    @IBAction func fourButtonAction(_ sender: Any) {
        AppDelegate.navigator.pushNib(FourViewController.self)
    }
    
    @IBAction func fiveButtonAction(_ sender: Any) {
        AppDelegate.navigator.showNib(FiveViewController.self)
    }
    
    @IBAction func sixButtonAction(_ sender: Any) {
        AppDelegate.navigator.setNib(SixViewController.self)
    }
}
