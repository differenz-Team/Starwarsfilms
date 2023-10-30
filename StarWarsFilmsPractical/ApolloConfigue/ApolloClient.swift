//
//  ApolloClient.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import Foundation
import Apollo

///`Network` Class which is used as Signgleton
///And being used as a Network Manager

class Network {
    static let shared = Network()
    
    private init() {}
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)
}


