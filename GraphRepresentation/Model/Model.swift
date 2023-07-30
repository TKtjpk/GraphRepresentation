//
//  Model.swift
//  GraphRepresentation
//
//  Created by Tomasz Kubicki on 27/07/2023.
//

import Foundation

struct TemperatureDB: Decodable, Identifiable {
    
    var id: String?
    var temp: Double?
}
