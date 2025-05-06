//
//  ContentView.swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 06.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0.0) {
                Text("6.05")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(hex: "727272"))
                
                HStack {
                    Text("today")
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .bold))
                    Spacer()
                    chevron
                    Spacer()
                    Text("3 days")
                        .foregroundStyle(Color(hex: "00A907"))
                        .font(.system(size: 40, weight: .bold))
                }
              
            }
            Spacer()
            Text("Start in three days")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal, 37)
        .padding(.vertical, 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "2D2D2D"))
    }
}

private extension ContentView {
    var chevron: some View {
        HStack {
            Rectangle()
                .frame(width: 50, height: 2)
            Image(systemName: "chevron.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 10)
                .offset(x: -10)
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
