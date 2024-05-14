//
//  Struct.swift
//  WDH-ViewModel
//
//  Created by Anna Hoff on 08.05.24.
//

import Foundation

struct Pizza: Equatable {
    let name: String
    var size: Size
    let ingredients: [String]
}

enum Size: String, CaseIterable {
    case small = "Klein"
    case medium = "Mittel"
    case big = "Groß"
}
