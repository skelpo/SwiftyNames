//
//  SwiftyNamesTests.swift
//  SwiftyNamesTests
//
//  Created by Ralph Küpper on 7/25/18.
//  Copyright © 2018 Skelpo Inc. All rights reserved.
//

import XCTest
@testable import SwiftyNames

class SwiftyDatesTests: XCTestCase {
    func testNames() {
        let testNames = [
            "Ralph Küpper",
            "Christoph Alexander Klein",
            "Küpper, Freia",
            "KÜPPER, FREIA",
            "Küpper, Freia Astrid",
            "Küpper, Freia Astrid Herdis Torsten",
            "Prof. Dr. Klein",
            "Prof. Dr. Stefan Klein",
            "PROF. DR. STEFAN KLEIN",
            "Ralph",
            "Andrew Miles Kuepper",
            "Dr. Klein VI",
            "William Franklin Ward IV",
            "Ward, William Franklin IV",
            "Dr. Ward, William Franklin III",
            "LOUIS RUSSELL WONDERLY JR",
            "John Willard Marriott, Jr",
            "Raoul : Roßmann"
        ]
        
        for name in testNames {
            let np = name.getNameParts()
            print("NP: ", np)
        }
    }
    
}
