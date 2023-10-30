//
//  HomeViewModel.swift
//  ListingDemoSwiftUI
//
//  Created by differenz210 on 30/10/23.
//

import Foundation
import Apollo
import StarWarsAPI
import SwiftUI

///`HomeViewModel`
class HomeViewModel: ObservableObject {
    @Published var lblNoDataFoundHidden: Bool = true
    @Published var isDataLoading: Bool = false
    
    @Published var arrFilmsData: [AllFilmsQuery.Data.AllFilms.Film?] = []
    @Published var filteredFilmsData: [AllFilmsQuery.Data.AllFilms.Film?] = []
    
    @Published var searchString: String = ""
    
    init() {
        getFilmsData()
    }
    
}

///`getFilmsData()`
extension HomeViewModel {
    ///Getting the Data from the server
    func getFilmsData() {
        isDataLoading = true
        Indicator.show()
        Network.shared.apollo.fetch(query: AllFilmsQuery()) { [weak self] result in
            Indicator.hide()
            guard let self = self else { return }
            switch result {
                case .success(let graphQLResult):
                    self.arrFilmsData = graphQLResult.data?.allFilms?.films ?? []
                    self.filteredFilmsData = graphQLResult.data?.allFilms?.films ?? []
                    self.isDataLoading = false
                    
                case .failure(let error):
                    self.lblNoDataFoundHidden = true
                    Alert.show(title: "", message: ResponseErrors.kBadRequestError, isLogOut: false)
                    print("Failure! Error: \(error)")
            }
        }
    }
    
    ///This function is used for filtering the fims according to search
    func filterData() {
        if !self.searchString.isEmpty {
            self.filteredFilmsData = self.arrFilmsData.filter({($0?.title ?? "").lowercased().contains(self.searchString.lowercased())})
        } else {
            self.filteredFilmsData = self.arrFilmsData
        }
    }
}

