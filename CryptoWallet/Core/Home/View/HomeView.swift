//
//  HomeView.swift
//  CryptoWallet
//
//  Created by apple on 29/11/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Crypto Wallet")
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}
