//
//  MainViewModel.swift
//  TestingLeaderboard
//
//  Created by thaxz on 20/07/23.
//

import Foundation
import GameKit

final class MainViewModel: NSObject, ObservableObject, UINavigationControllerDelegate {
    
    @Published var playerAuthState: AuthStates = .authenticating
    
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
                playerAuthState = .error
                print(error?.localizedDescription ?? "not found")
                return
            }
            // If there's no error and there is a viewcontroller, showing viewcontroller
            if let viewController = viewController {
                rootViewController?.present(viewController, animated: true)
                return
            }
            
            // (Optional) Checking if the player's allowed to play multiplayer games
            if player.isAuthenticated {
                if player.isMultiplayerGamingRestricted {
                    playerAuthState = .restricted
                } else {
                    playerAuthState = .authenticaded
                }
            } else {
                playerAuthState = .unauthenticated
            }
        }
    }
    
    // Show achievements
    func showAchievements(){
        // Creating a view controller to the GC's Achievements
        let gcViewController = GKGameCenterViewController(state: .achievements)
        gcViewController.delegate = self
        rootViewController?.present(gcViewController, animated: true)
        
    }
    
    func showLeaderboard(){
        // Creating a view controller to the GC's Leaderboard
        let gcViewController = GKGameCenterViewController(leaderboardID: "myrandomstuff", playerScope: .global, timeScope: .allTime)
        gcViewController.delegate = self
        rootViewController?.present(gcViewController, animated: true)
    }
    
    func getAchievement(achievement bundle: String){
        // Getting an achievement by its identifier
        let achievement = GKAchievement(identifier: bundle)
        // Unlocking and showing banner
        achievement.percentComplete = 100 // 0 - 100
        achievement.showsCompletionBanner = true
        GKAchievement.report([achievement]) { error in
            // if there's no error
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
            // Show something to the user!
            print("Something nice :)")
        }
    }
    
    //TODO: Make it report more than once
    func submitScore(score: Int, forLeaderboardID id: String){
        //test
        GKLeaderboard.submitScore(score, context: 0, player: GKLocalPlayer.local, leaderboardIDs: [id]) { error in
            guard error == nil else {
                print(error?.localizedDescription ?? "")
                return
            }
        }
    }
    
    
    
}

