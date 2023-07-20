//
//  MainViewModel.swift
//  TestingLeaderboard
//
//  Created by thaxz on 20/07/23.
//

import Foundation
import GameKit

final class MainViewModel: ObservableObject {
    
    // Since we're using SwiftUI, creating viewcontroller
    var rootViewController: UIViewController? {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        return windowScene?.windows.first?.rootViewController
    }
    
    // Authenticate user
    func authenticateUser(){
        // Getting local player
        let player = GKLocalPlayer.local
        // Getting back viewController or error
        player.authenticateHandler = { [self] viewController, error in
            // If there's an error
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            // If there's no error and there is a viewcontroller, showing viewcontroller
            if let viewController = viewController {
                rootViewController?.present(viewController, animated: true)
                return
            }
        }
    }
    
    
}

