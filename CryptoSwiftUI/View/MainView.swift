//
//  ContentView.swift
//  CryptoSwiftUI
//
//  Created by Berkay Emre Aslan on 11.04.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListVM : CryptoListViewModel
    
    init() {
        self.cryptoListVM = CryptoListViewModel()
    }
    
    
    var body: some View {
        
        NavigationView {
            
            List(cryptoListVM.cryptoList, id: \.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.toolbar(content: {
                Button(action: {
                    Task.init{
                        cryptoListVM.cryptoList = []
                        await cryptoListVM.downloadCryptosAsync(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)}
                    }, label: {
                    Text("Refresh")
                })
            })
            
            .navigationTitle(Text("BEA Crypto"))
        }.task {
            await cryptoListVM.downloadCryptosAsync(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!)
        }
    }
    
    #Preview {
        MainView()
    }
}
