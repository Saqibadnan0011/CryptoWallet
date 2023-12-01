//
//  Color.swift
//  CrytoWallet
//
//  Created by apple on 29/11/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let dark = Color("DarkGreen")
    let secondaryText = Color("SecondaryTextColor")
}

