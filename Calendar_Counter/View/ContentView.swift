//
//  ContentView.swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 06.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowDateView = false
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0.0) {
                Text(Date.now.formatToString())
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color(hex: "727272"))
                
                HStack {
                    Text("today")
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .bold))
                    Spacer()
                    chevron
                    Spacer()
                    Text(vm.endDate)
                        .foregroundStyle(Color(hex: "00A907"))
                        .font(.system(size: 40, weight: .bold))
                        .onTapGesture {
                            isShowDateView.toggle()
                        }
                }
              
            }
            Spacer()
            Text(vm.mainText.isEmpty ? "" : vm.mainText + " days")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal, 37)
        .padding(.vertical, 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "2D2D2D"))
        .sheet(isPresented: $isShowDateView) {
            DateView(vm: vm)
                .presentationDetents([.height(600)])
        }
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

