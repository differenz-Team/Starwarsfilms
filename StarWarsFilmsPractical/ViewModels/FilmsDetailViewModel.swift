//
//  FilmsDetailViewModel.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import Foundation
import StarWarsAPI
import SwiftUI

///`FilmsDetailViewModel`
class FilmsDetailViewModel: ObservableObject {
    @Published var lblNoDataFoundHidden: Bool = true
    
    @Published var filmDetail: FilmQuery.Data.Film? = nil
    @Published var isDataLoading: Bool = false

}

///`getFilmsData()`
extension FilmsDetailViewModel {
    ///This function is used for getting Detail data 
    func getFilmsDetailData(id: String) {
        isDataLoading = true
        Network.shared.apollo.fetch(query: FilmQuery(filmId: GraphQLNullable<String>(stringLiteral: id))) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let graphQLResult):
                    self.filmDetail = graphQLResult.data?.film
                    self.isDataLoading = false
                    if self.filmDetail == nil {
                        Alert.show(title: "", message: ResponseErrors.kBadRequestError)
                    }

                case .failure(let error):
                    self.lblNoDataFoundHidden = true
                    Alert.show(title: "", message: ResponseErrors.kBadRequestError)
                    print("Failure! Error: \(error)")
            }
        }
    }
}
