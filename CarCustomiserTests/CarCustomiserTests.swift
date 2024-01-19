//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Kurumlu, Koza (RCH) on 18/01/2024.
//

import XCTest
@testable import CarCustomiser

final class CarCustomiserTests: XCTestCase {
    func testNewCarGivesMeACarWithAllAttributesSet(){
        //arrange
        let car = Car(make:"Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func carDisplaysStats(){
        //arrange
        let car = Car(make:"Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.displayStats(), ["Make \(car.make)", "Model \(car.model)", "Top Speed \(car.topSpeed)mph", "Accerleration (0-60) \(car.acceleration)s", "Handling \(car.handling)"])
    
    }
}
