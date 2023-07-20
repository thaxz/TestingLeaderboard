//
//  ContentView.swift
//  TestingLeaderboard
//
//  Created by thaxz on 20/07/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        VStack(spacing: 40){
            Button("Show Achievements") {
                viewModel.showAchievements()
            }
            .buttonStyle(.borderedProminent)
            Button("Show Leaderboard") {
                viewModel.showLeaderboard()
            }.buttonStyle(.borderedProminent)
            Button("Unlock Achievement") {
                viewModel.getAchievement()
            }.buttonStyle(.borderedProminent)
            Button("Sumit Score") {
                
            }.buttonStyle(.borderedProminent)
        }
        .padding(20)
        .onAppear{
            viewModel.authenticateUser()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
