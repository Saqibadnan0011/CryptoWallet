//
//  HomeView.swift
//  CryptoWallet
//
//  Created by apple on 29/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showProtfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
               homeHeader
                if !showProtfolio {
                    List {
                        ForEach(vm.allCoins) { coin in
                            CoinRowView(coin: coin, showHoldingsColumn: false)
                        }
                    }
                    .listStyle(.plain)
                    .transition(.move(edge: .leading))
                }
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
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showProtfolio ? "plus" : "info")
                .animation(.none)
                .background(
                    CircleButtonAnimation(animate: $showProtfolio)
                )
            Spacer()
            Text(showProtfolio ? "Portfolio" : "Live Price")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showProtfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showProtfolio.toggle()
                    }
                }
            
        }
        .padding(.horizontal)
    }
}
