//
//  AuthStates.swift
//  TestingLeaderboard
//
//  Created by thaxz on 20/07/23.
//

import Foundation

enum AuthStates: String {
    
    case authenticating = "Loggin in into Game Center"
    case unauthenticated = "Please sign in to Game Center to play"
    case authenticaded = "Authenticated user"
    
    case error = "There was an error logging into Game Center"
    case restricted = "You are not allowed to play multiplayer games"
    case unknown = "Unknown"
    
}
