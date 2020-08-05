//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var additions: String
   // var photoCredit: String
    var price: Double
    //var restrictions: [String]
    //var description: String

//    var mainImage: String {
//        name.replacingOccurrences(of: " ", with: "-").lowercased()
//    }
//
//    var thumbnailImage: String {
//        "\(mainImage)-thumb"
//    }

    #if DEBUG
    static let example = MenuItem(id: UUID(), name: "Maple French Toast", additions: "bacon", price: 6)
    #endif
 
}
