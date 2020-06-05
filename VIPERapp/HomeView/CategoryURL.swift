//
//  CategoryURL.swift
//  VIPERapp
//
//  Created by beTech CAPITAL on 05/06/20.
//  Copyright © 2020 Ezequiel Barreto. All rights reserved.
//

import Foundation

struct CategoryURL: Codable {
    
    var _links: Links
    struct Links: Codable{
        var selfito: [datoURL]
        
        enum CodingKeys: String, CodingKey{
            case selfito = "self"
        }
    }
    
    struct datoURL: Codable {
        var href: String
    }
}
