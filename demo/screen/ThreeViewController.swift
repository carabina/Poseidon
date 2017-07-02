//
//  ThreeViewController.swift
//  Poseidon
//
//  Created by Alex Motor on 02.07.17.
//  Copyright © 2017 Alex Motor. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    private let mainVC = "MainViewController"

    @IBAction func setAction(_ sender: Any) {
        AppDelegate.navigator.set(mainVC)
    }

}
