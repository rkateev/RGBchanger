//
//  ContentView.swift
//  RGBchanger
//
//  Created by  Husein on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 150)
                .foregroundColor(Color(red: redSliderValue/255, green: greenSliderValue/255, blue: blueSliderValue/255))
            SliderView(value: $redSliderValue)
            SliderView(value: $greenSliderValue)
            SliderView(value: $blueSliderValue)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct SliderView: View {
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 50)
            Slider(value: $value, in: 0...255, step: 1)
            TextField("", value: $value, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
        }
    
    }
}
