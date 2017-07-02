//
//  NavigationMap.swift
//  Poseidon
//
//  Created by Alex Motor on 02.07.17.
//  Copyright © 2017 Alex Motor. All rights reserved.
//

import UIKit

public class NavigatingMap {
    
    /**
     Persited storybaords with their identifier.
     */
    let storyboardsByID: [String : UIStoryboard]
    let defaultStoryboard: UIStoryboard
    
    /**
     Initializer to create application map to navigation.
     
     This method create dictionary with IDs and its related item(UIStoryboard or UINib), which will be use to navigate.
     
     - parameters:
        - storyboardsID: Array of storyboard names. This storyboard will be initialized and persist to fetch controllers.
        - defaultStoryboardName: Name of the storyboard, which will be use by default to fetch controller.
            This name must be in storyboardsID array.
     */
    public init(_ storyboardsID: [String], _ defaultStoryboardName: String) {
        
        var storyboardsByID = [String : UIStoryboard]()
        storyboardsID.forEach { (name) in
            storyboardsByID[name] = UIStoryboard(name: name, bundle: nil)
        }
        
        self.storyboardsByID = storyboardsByID
        
        assert(storyboardsByID[defaultStoryboardName] != nil, "MainStoryboardName must be in storyboardsID array.")
        self.defaultStoryboard = storyboardsByID[defaultStoryboardName]!
    }
    
}
