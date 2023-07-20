//
//  MainVM+GCViewControllerDelegate.swift
//  TestingLeaderboard
//
//  Created by thaxz on 20/07/23.
//

import Foundation
import GameKit

// Extending to access GC's methods
extension MainViewModel: GKGameCenterControllerDelegate {
    
    // Dismiss when finished
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true)
    }
    
    
    

    
    
}
