//
//  HomeView.swift
//  CryptoWallet
//
//  Created by apple on 29/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showProtfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CircleButtonView(iconName: "info")
                    Spacer()
                    Text("Live Price")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.theme.accent)
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
