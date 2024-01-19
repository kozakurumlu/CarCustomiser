//
//  Car.swift
//  CarCustomiser
//
//  Created by Kurumlu, Koza (RCH) on 18/01/2024.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> [String]{
        let makeDisplay = "Make \(make)"
        let modelDisplay = "Model \(model)"
        let topSpeedDisplay = "Top Speed \(topSpeed)mph"
        let accelerationDisplay = "Accerleration (0-60) \(acceleration)s"
        let handlingDisplay = "Handling \(handling)"
        return [makeDisplay, modelDisplay, topSpeedDisplay, accelerationDisplay, handlingDisplay]
    }
}
