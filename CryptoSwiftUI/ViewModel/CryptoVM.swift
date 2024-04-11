//
//  CryptoVM.swift
//  CryptoSwiftUI
//
//  Created by Berkay Emre Aslan on 11.04.2024.
//

import Foundation

@MainActor
class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoVM]()
    
    let webservice = Webservice()
    
    func downloadCryptosAsync(url: URL) async {
        do{
            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
                self.cryptoList = cryptos.map(CryptoVM.init)
        }catch{
            print(error)
        }
    }
}

struct CryptoVM {
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    var currency : String {
        crypto.currency
    }
    var price : String {
        crypto.price
    }
}
