//
//  ContentView.swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 06.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowDateView = false
    
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
                        .onTapGesture {
                            isShowDateView.toggle()
                        }
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
        .sheet(isPresented: $isShowDateView) {
            DateView()
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

struct DateView: View {
    @State var selectedDate: Date = Date()
    @State var text: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 26.0) {
            DatePicker("", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding()
                .background(Color(hex: "1C1C1E"))
                .clipShape(.rect(cornerRadius: 20))
                .environment(\.colorScheme, .dark)
            
            TextField("Date text", text: $text)
                .padding(30)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
                .background(Color(hex: "1C1C1E"))
                .clipShape(.rect(cornerRadius: 20))
            
            Button {
                dismiss()
            } label: {
                Text("Set")
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(.rect(cornerRadius: 20))
            }

        }
        .padding(.horizontal, 20)
        .padding(.top, 30)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.black)
    }
        
}
