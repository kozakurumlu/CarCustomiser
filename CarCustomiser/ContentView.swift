//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Kurumlu, Koza (RCH) on 18/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var noxPackage = false
    
    var body: some View {
        let exhaustPackageBinding = Binding<Bool>(
            get: {self.exhaustPackage},
            set: { newValue in self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else{
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool>(
            get: {self.tiresPackage},
            set: { newValue in self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else{
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        
        let noxPackageBinding = Binding<Bool>(
            get: {self.noxPackage},
            set: { newValue in self.noxPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 1
                } else{
                    starterCars.cars[selectedCar].acceleration += 1
                }
            }
        )
        
        Form{
            VStack ( alignment: .leading, spacing: 20){
                Text(starterCars.cars[selectedCar].displayStats())
                Button("Random Car", action: {
                    if (selectedCar + 1) == self.starterCars.cars.count{
                        selectedCar = 0
                    }
                    else{
                        selectedCar += 1
                    }
                    
                })
                Section{
                    Toggle("Exhuast Package", isOn: exhaustPackageBinding)
                    Toggle("Tires Package", isOn: tiresPackageBinding)
                    Toggle("NOx", isOn: noxPackageBinding)
                    
                }
            }
        }
    }
        
}

#Preview {
    ContentView()
}
