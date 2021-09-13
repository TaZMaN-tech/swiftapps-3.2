//
//  ContentView.swift
//  ColorApp
//
//  Created by Тадевос Курдоглян on 13.09.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    @State private var greenSlidreValue = Double.random(in: 0...255)
    
    
    var body: some View {
        VStack {
            ColorView(red: redSliderValue, blue: blueSliderValue, green: greenSlidreValue)
                .padding(.bottom)
            ColorSlider(value: $redSliderValue, color: .red)
            ColorSlider(value: $blueSliderValue, color: .blue)
            ColorSlider(value: $greenSlidreValue, color: .green)
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    let color: Color
    @State private var alertPresented = false
    
    var valueTextField: Binding<String> {
            Binding<String>(
                get: { String(format: "%.00f", Double(self.value)) },
                set: {
                    if let value = NumberFormatter().number(from: $0) {
                        self.value = value.doubleValue
                    } else {
                        alertPresented.toggle()
                    }
                }
            )
        }
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundColor(.red)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            TextField("", text: valueTextField)
                .frame(width: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .alert(isPresented: $alertPresented) {
                    Alert(title: Text("Wrong Format!"), message: Text("Enter digits!"))
                }
        }
    }
    
}
