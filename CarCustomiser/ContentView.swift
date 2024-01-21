//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Kurumlu, Koza (RCH) on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    let starterCars = StarterCars()
    var selectedCar: Int = 0
    
    var body: some View {
        VStack{
            Text(starterCars.car[selectedCar].displayStats())
            Button("Random Car", action: {print("Button Pressed")})
            
            
        }
    }
}

#Preview {
    ContentView()
}
