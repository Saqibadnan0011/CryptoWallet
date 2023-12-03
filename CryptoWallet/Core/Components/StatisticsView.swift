//
//  StatisticsView.swift
//  CryptoWallet
//
//  Created by apple on 03/12/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    let stat: Statistics
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180 ))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(stat: dev.stat1)
    }
}
