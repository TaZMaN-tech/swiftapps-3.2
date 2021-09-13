//
//  ColorView.swift
//  ColorApp
//
//  Created by Тадевос Курдоглян on 13.09.2021.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let blue: Double
    let green: Double
    
    var body: some View {
        Rectangle()
            .foregroundColor(.init(red: red/255.0, green: green/255.0, blue: blue/255.0))
            .frame(width: 300, height: 150)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 3, blue: 66, green: 3
        )
    }
}
