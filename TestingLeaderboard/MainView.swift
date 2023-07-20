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
                viewModel.authenticateUser()
            }
            .buttonStyle(.borderedProminent)
            Button("Show Leaderboard") {
                
            }.buttonStyle(.borderedProminent)
            Button("Unlock Achievement") {
                
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