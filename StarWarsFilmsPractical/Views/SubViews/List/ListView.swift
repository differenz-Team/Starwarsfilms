//
//  ListView.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import SwiftUI
import StarWarsAPI

///`ListView`
struct ListView: View {
    @Binding var arrHomeScreenData: [AllFilmsQuery.Data.AllFilms.Film?]
    
    var cellTapped:((Int) -> ())
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< self.arrHomeScreenData.count, id: \.self) { i in
                    Button {
                        cellTapped(i)
                    } label: {
                        ListCell(homeScreenModel:self.$arrHomeScreenData[i])
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(arrHomeScreenData: .constant([])) { i in
            
        }
    }
}


