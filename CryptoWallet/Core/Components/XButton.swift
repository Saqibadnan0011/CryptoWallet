//
//  XButton.swift
//  CryptoWallet
//
//  Created by apple on 04/12/2023.
//

import SwiftUI

struct XButton: View {
    
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
         presentationMode.wrappedValue.dismiss()
        }, label: {
        Image(systemName: "xmark")
            .font(.headline)
      })
    }
}

struct XButton_Previews: PreviewProvider {
    static var previews: some View {
        XButton()
    }
}
