//
//  Webservice.swift
//  CryptoSwiftUI
//
//  Created by Berkay Emre Aslan on 11.04.2024.
//

import Foundation

class Webservice {
    
    func downloadCurrenciesAsync(url: URL) async throws -> [CryptoCurrency] {
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        return currencies ?? []
        
    }
}
enum downloaderError : Error{
    case badUrl
    case noData
    case dataParseError
}
