//
//  Navigator.swift
//  Poseidon
//
//  Created by Alex Motor on 08.06.17.
//  Copyright © 2017 Alex Motor. All rights reserved.
//

import UIKit

/**
 Class to manage navigation by App.
 */
class Navigator {
    
    private let storyboard: UIStoryboard
    let navigationController: UINavigationController
    
    /**
     Initialization with storyboard by name
     */
    init(storyboardName: String) {
        storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        navigationController = UINavigationController(rootViewController: storyboard.instantiateInitialViewController()!)
    }
    
    /**
     Show controller with specified ID on screen by pushing in navigation stack.
     */
    func push(_ controllerID: String, animated: Bool = true) {
        let controller =  storyboard.instantiateViewController(withIdentifier: controllerID)
        navigationController.pushViewController(controller, animated: animated)
    }
    
}
