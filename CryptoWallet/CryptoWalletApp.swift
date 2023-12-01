//
//  CrytoWalletApp.swift
//  CrytoWallet
//
//  Created by apple on 28/11/2023.
//

import SwiftUI

@main
struct CrytoWalletApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
