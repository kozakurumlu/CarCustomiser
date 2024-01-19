//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Kurumlu, Koza (RCH) on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make:"Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        let data = car.displayStats()
        Text(data[0])
        Text(data[1])
        Text(data[2])
        Text(data[3])
        Text(data[4])
        
    }
}

#Preview {
    ContentView()
}