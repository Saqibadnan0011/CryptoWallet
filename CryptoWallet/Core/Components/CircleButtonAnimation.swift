//
//  CircleButtonAnimation.swift
//  CryptoWallet
//
//  Created by apple on 01/12/2023.
//

import SwiftUI

struct CircleButtonAnimation: View {
    
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ?  Animation.easeOut(duration: 1.0) : .none)
            
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimation(animate: .constant(false))
            .foregroundColor(.black)
            .frame(width: 100, height: 100)
    }
}
