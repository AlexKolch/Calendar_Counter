//
//  DateView.swift
//  Calendar_Counter
//
//  Created by Алексей Колыченков on 07.05.2025.
//

import SwiftUI

struct DateView: View {
    @State var selectedDate: Date = Date()
    @State var text: String = ""
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack(spacing: 26.0) {
            DatePicker("", selection: $selectedDate,
                       in: Date()..., displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding()
                .background(Color(hex: "1C1C1E"))
                .clipShape(.rect(cornerRadius: 20))
                .environment(\.colorScheme, .dark)
                .tint(.green)
            
            TextField("", text: $text, prompt: Text("Event's description").foregroundStyle(.white.opacity(0.6)).fontWeight(.regular))
                .padding(30)
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
                .background(Color(hex: "1C1C1E"))
                .clipShape(.rect(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(hex: "00A907")) )
            
            //MARK: Кнопка сохранения введенных данных
            Button {
                text += " in {date}"
                vm.save(text: text, and: selectedDate)
                dismiss()
            } label: {
                Text("Set")
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 25, weight: .bold))
                    .foregroundColor(.white)
                    .background(Color(hex: "00A907"))
                    .clipShape(.rect(cornerRadius: 20))
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 30)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.black)
    }
}

#Preview {
    DateView(vm: ViewModel())
}
