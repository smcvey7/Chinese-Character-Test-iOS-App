//
//  NumberInputView.swift
//  Chinese-Character-Test-iOS
//
//  Created by Steven McVey on 11/1/23.
//

import SwiftUI

struct NumberInputView: View {
    @Binding var content: Int
    let minVal: Int
    let maxVal: Int
    let label: String
    @State private var isExpanded = false


    var body: some View {
        HStack {
            Text("\(label)")
                .font(.system(size: 14))
            
            Spacer()
                
            DisclosureGroup("Select", isExpanded: $isExpanded) {
                        Picker("\(label)", selection: $content) {
                            ForEach(minVal...maxVal, id: \.self) { value in
                                Text("\(value)")
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                    }
            .onTapGesture {
                isExpanded.toggle()
            }
            
            Spacer()
            
            Text("\(content)")
                .font(.system(size: 14))
        }
       
    }
}

#Preview {
    NumberInputView(content: .constant(0), minVal: 0, maxVal: 100, label: "label")
}
