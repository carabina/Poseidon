//
//  Navigator.swift
//  Poseidon
//
//  Created by Alex Motor on 02.07.17.
//  Copyright © 2017 Alex Motor. All rights reserved.
//

import UIKit

public class Navigator {
    
    let navigationController: UINavigationController
    private let navigatingMap: NavigatingMap
    
    /**
     Initializer with navigating map and root controller, which will be showed on launch.
     
     - parameters: 
        - navigatingMap: Map to navigation be application (contains storyboards).
        - rootController: Launch controller. Will be root to UINavigationController. 
            If nil - will be using initial view contoller from default storyboard.
     */
    init(_ navigatingMap: NavigatingMap, _ rootController: UIViewController? = nil) {
        self.navigatingMap = navigatingMap
        
        if let rootController = rootController {
            self.navigationController = UINavigationController(rootViewController: rootController)
        } else {
            let defaultController = navigatingMap.defaultStoryboard.instantiateInitialViewController()!
            self.navigationController = UINavigationController(rootViewController: defaultController)
        }
    }
    
    /**
     Fetch view controller from nib file with name equal class name.
     
     - parameter vcClass: Class to create from nib with same name.
     
     - returns: UIViewController from nib file.
     */
    private func viewControllerFromNib(_ vcClass: UIViewController.Type) -> UIViewController {
        return vcClass.init(nibName: String(describing: vcClass), bundle: nil)
    }
    
    /**
     Fetch storyboard from Navigation Map with specified ID. 
     
     If name is nil then default storyboard will be fetched.
     
     - parameter storyboardName: Name of storyboard to fetch. Can be nil. Then will be used default storyboard.
     
     - returns: Fetched storyboard.
     */
    private func storyboardByID(_ storyboardName: String?) -> UIStoryboard {
        return storyboardName != nil ? navigatingMap.storyboardsByID[storyboardName!]! : navigatingMap.defaultStoryboard
    }
    
    /**
     Show controller, which will be fetched from xib file.
     
     This controller will be pushed to navigation controller and showed on screen.
     
     - parameters 
        - vcClass: Class to create from nib with same name.
        - animated: Push to navigation controller animated or not. Default true.
     */
    public func pushNib(_ vcClass: UIViewController.Type, animated: Bool = true) {
        navigationController.pushViewController(viewControllerFromNib(vcClass), animated: animated)
    }
    
    /**
     Show controller by storyboard ID.
     
     This controller will be pushed to navigation controller and showed on screen.
     
     - parameters: 
        - storyboardID: Screen identifier in storyboard.
        - storyboardName: Storyboard name to fetch screen by ID. 
            If nil then will be used default storyboard from Navigation Map.
        - animated: Push to navigation controller animated or not. Default true.
     */
    public func push(_ storyboardID: String, _ storyboardName: String? = nil, _ animated: Bool = true) {
        let controller = storyboardByID(storyboardName).instantiateViewController(withIdentifier: storyboardID)
        
        navigationController.pushViewController(controller, animated: animated)
    }
    
    /**
     Pop current controller from navigation stack and return to previous screen.
     
     - parameter animated: Pop from navigation controller animated or not. Default true.
     */
    public func pop(_ animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    /**
     Present controller modally, which will be fetched from xib file.
     
     - parameters: 
        - vcClass: Class to create from nib with same name.
        - animated: Present controller animated or not. Default true.
        - completion: Completion block, which will be perform after presenting controller. Default nil.

     */
    public func showNib(_ vcClass: UIViewController.Type, animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.present(viewControllerFromNib(vcClass), animated: animated, completion: completion)
    }
    
    /**
     Present controller modally by storyboard ID.
     
     - parameters:
         - storyboardID: Screen identifier in storyboard.
         - storyboardName: Storyboard name to fetch screen by ID.
                If nil then will be used default storyboard from Navigation Map.
         - animated: Present controller animated or not. Default true.
         - completion: Completion block, which will be perform after presenting controller. Default nil.
     */
    public func show(_ storyboardID: String,
                     _ storyboardName: String? = nil,
                     _ animated: Bool = true,
                     _ completion: (() -> Void)? = nil) {
        
        let controller = storyboardByID(storyboardName).instantiateViewController(withIdentifier: storyboardID)

        navigationController.present(controller, animated: animated, completion: completion)
    }
    
    /**
     Dismiss current controller, which is showing modally. And show screen under it.
     
     - parameters:
         - animated: Dismiss controller animated or not. Default true.
         - completion: Completion block, which will be perform after dismissing controller. Default nil.
     */
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.presentedViewController?.dismiss(animated: animated, completion: completion)
    }
    
    /**
     Clear navigation stack and set controller from xib file like root.
     
     - parameters: 
         - vcClass: Class to create from nib with same name.
         - animated: Set controller animated or not. Default true.

     */
    public func setNib(_ vcClass: UIViewController.Type, animated: Bool = true) {
        
        navigationController.setViewControllers([viewControllerFromNib(vcClass)], animated: animated)

    }
    
    /**
     Clear navigation stack and set controller with storyboard ID like root.
     
     - parameters:
        - storyboardID: Screen identifier in storyboard.
        - storyboardName: Storyboard name to fetch screen by ID.
            If nil then will be used default storyboard from Navigation Map.
        - animated: Set controller animated or not. Default true.

     */
    public func set(_ storyboardID: String, _ storyboardName: String? = nil, animated: Bool = true) {
        let controller = storyboardByID(storyboardName).instantiateViewController(withIdentifier: storyboardID)

        navigationController.setViewControllers([controller], animated: animated)
    }
}
