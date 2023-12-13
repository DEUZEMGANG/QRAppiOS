//
//  CustomButton.swift
//  QRApp
//
//  Created by admin on 13.12.2023.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let textColor: Color
    let font: Font
    let fontWeight: Font.Weight
    let buttonColor: Color
    let roundedRectangleRadius: CGFloat
    let padding: CGFloat
    let frameMaxHeight: CGFloat
    let frameMaxWidth: CGFloat
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: roundedRectangleRadius)
            .frame(maxHeight: frameMaxHeight)
            .frame(maxWidth: frameMaxWidth)
            .padding(.horizontal,padding)
            .foregroundStyle(buttonColor)
            .overlay(alignment: .center) {
                Text(text)
                    .font(font)
                    .fontWeight(fontWeight)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(textColor)
                    .frame(maxWidth: frameMaxWidth ,maxHeight: frameMaxHeight)
                    .padding(.horizontal, padding)
                
                
            }
    }
}

#Preview {
    CustomButton(text: "slllaxlalsaodwkdoqskx", textColor: .black, font: .title, fontWeight: .bold, buttonColor: .blue, roundedRectangleRadius: 15, padding: 40, frameMaxHeight: 60, frameMaxWidth: .infinity)
}
