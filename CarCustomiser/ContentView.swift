//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Kurumlu, Koza (RCH) on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    let starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    var body: some View {
        VStack ( alignment: .leading, spacing: 20){
            Text(starterCars.car[selectedCar].displayStats())
            Button("Random Car", action: {
                if (selectedCar + 1) == self.starterCars.car.count{
                    selectedCar = 0
                }
                else{
                    selectedCar += 1
                }
            })
            
            
        }
    }
}

#Preview {
    ContentView()
}
