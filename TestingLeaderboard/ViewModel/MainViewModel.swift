//
//  MainViewModel.swift
//  TestingLeaderboard
//
//  Created by thaxz on 20/07/23.
//

import Foundation
import GameKit
import SwiftUI

final class MainViewModel: NSObject, ObservableObject, UINavigationControllerDelegate {
    
    @Published var playerAuthState: AuthStates = .authenticating
    
    @AppStorage("GKGameCenterViewControllerState") var gameCenterViewControllerState:GKGameCenterViewControllerState = .default
    @AppStorage("IsGameCenterActive") var isGKActive: Bool = false
    
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
        gameCenterViewControllerState = .achievements
        isGKActive = true
    }
    
    func showLeaderboard(){
        // Creating a view controller to the GC's Leaderboard
        gameCenterViewControllerState = .leaderboards
        isGKActive = true
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

