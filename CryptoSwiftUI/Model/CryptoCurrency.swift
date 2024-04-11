//
//  CryptoCurrency.swift
//  CryptoSwiftUI
//
//  Created by Berkay Emre Aslan on 11.04.2024.
//

import Foundation

struct CryptoCurrency : Decodable, Identifiable, Hashable {
    
    let id = UUID()
    let currency : String
    let price : String
    
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
}
