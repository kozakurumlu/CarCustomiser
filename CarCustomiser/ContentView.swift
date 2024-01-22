//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Kurumlu, Koza (RCH) on 18/01/2024.
//

import SwiftUI

struct carState {
    @State public var exhaustPackage = false
    @State public var tiresPackage = false
    @State public var noxPackage = false
    @State public var suspensionPackage = false
    @State public var remainingFunds = 1000
}


struct ContentView: View {
    @State private var starterCars = StarterCars()
    
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var noxPackage = false
    @State private var suspensionPackage = false
    @State private var remainingFunds = 1000
    @State private var carStates: [carState] = [carState(), carState(), carState(), carState()]
    
    var exhaustPackageEnabled: Bool {
            if exhaustPackage == true {
                return true
            }
            else if remainingFunds-350 > 0{
                return true
            }
            else{
                return false
            }
        }
    
    var tiresPackageEnabled: Bool {
        if tiresPackage == true {
            return true
        }
        else if remainingFunds-250 > 0{
            return true
        }
        else{
            return false
        }
    }
    var noxPackageEnabled: Bool {
        if noxPackage == true {
            return true
        }
        else if remainingFunds-300 > 0{
            return true
        }
        else{
            return false
        }
    }
        var suspensionPackageEnabled: Bool {
            if suspensionPackage == true {
                return true
            }
            else if remainingFunds-500 > 0{
                return true
            }
            else{
                return false
            }
        }
    var body: some View {
        let exhaustPackageBinding = Binding<Bool>(
            get: {self.exhaustPackage},
            set: { newValue in self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 350
                } else{
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 350
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool>(
            get: {self.tiresPackage},
            set: { newValue in self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 250
                } else{
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 250
                }
            }
        )
        
        let noxPackageBinding = Binding<Bool>(
            get: {self.noxPackage},
            set: { newValue in self.noxPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 2
                    remainingFunds -= 300
                } else{
                    starterCars.cars[selectedCar].acceleration += 2
                    remainingFunds += 300
                }
            }
        )
        
        let suspensionPackageBinding = Binding<Bool>(
            get: {self.suspensionPackage},
            set: { newValue in self.suspensionPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 1
                    starterCars.cars[selectedCar].acceleration -= 1
                    remainingFunds -= 500
                } else{
                    starterCars.cars[selectedCar].handling -= 1
                    starterCars.cars[selectedCar].acceleration += 1
                    remainingFunds += 500
                    
                }
            }
        )
        VStack{
            
            Form{
                VStack ( alignment: .leading, spacing: 20){
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Random Car", action: {
                        if (selectedCar + 1) == self.starterCars.cars.count{
                            selectedCar = 0
                            resetDisplay(carStates: carStates, previousCar: carStates.count-1, selectedCar: selectedCar)
                        }
                        else{
                            selectedCar += 1
                            resetDisplay(carStates: carStates, previousCar: selectedCar-1, selectedCar: selectedCar)
                        }
                        
                    })
                    Section{
                        Toggle("Exhuast Package (Cost: 350)", isOn: exhaustPackageBinding)
                            .disabled(!exhaustPackageEnabled)
                        Toggle("Tires Package (Cost: 250)", isOn: tiresPackageBinding)
                            .disabled(!tiresPackageEnabled)
                        Toggle("NOx (Cost: 300)", isOn: noxPackageBinding)
                            .disabled(!noxPackageEnabled)
                        Toggle("Suspension Package (Cost: 500)", isOn: suspensionPackageBinding)
                            .disabled(!suspensionPackageEnabled)
                        
                    }
                }
            }
            Text("Remaining Funds \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
    }
    func resetDisplay(carStates: [carState], previousCar: Int, selectedCar: Int){
        carStates[previousCar].exhaustPackage = self.exhaustPackage
        carStates[previousCar].tiresPackage = self.tiresPackage
        carStates[previousCar].noxPackage = self.noxPackage
        carStates[previousCar].suspensionPackage = self.suspensionPackage
        carStates[previousCar].remainingFunds = self.remainingFunds
        
        self.remainingFunds = carStates[selectedCar].remainingFunds
        self.tiresPackage = carStates[selectedCar].tiresPackage
        self.exhaustPackage = carStates[selectedCar].exhaustPackage
        self.suspensionPackage = carStates[selectedCar].suspensionPackage
        self.noxPackage = carStates[selectedCar].noxPackage
        
    }
        
}

#Preview {
    ContentView()
}
