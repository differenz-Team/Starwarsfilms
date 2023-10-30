//
//  ListCell.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import SwiftUI
import StarWarsAPI

/// `ListCell`
struct ListCell: View {
    @Binding var homeScreenModel: AllFilmsQuery.Data.AllFilms.Film?
    var body: some View {
        ZStack(alignment: .leading) {
            Color.appSnippetsColor
            HStack {
                VStack(alignment: .leading) {
                    Text(self.homeScreenModel?.title ?? "")
                        .font(.headline)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .padding(.bottom, 5)
                        .foregroundColor(Color.myDarkCustomColor)
                }
                .padding(.horizontal, 5)
            }
            .padding(15)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .fixedSize(horizontal: false, vertical: true)
    }
}
    

struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(homeScreenModel: .constant(nil))
    }
}
