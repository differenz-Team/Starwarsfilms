//
//  HomeView.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import SwiftUI

///`HomeView`
struct HomeView: View {
    ///`Declarations`
    @StateObject private var homeVM: HomeViewModel = HomeViewModel()
    
    @State var shouldMoveToDetail: Bool = false
    @State var selectedIndex: Int? = nil
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    if !self.homeVM.lblNoDataFoundHidden {
                        noDataFoundView()
                    } else {
                        VStack {
                            SearchBarView(searchString: self.$homeVM.searchString) {
                                self.homeVM.filterData()
                            }
                                .padding(.horizontal, 10)
                            ListView(arrHomeScreenData: self.$homeVM.filteredFilmsData) { i in
                                selectedIndex = i
                                shouldMoveToDetail = true
                            }
                            .redacted(when: homeVM.isDataLoading)

                            .padding(.horizontal,10)
                            .navigationDestination(isPresented: self.$shouldMoveToDetail) {
                                if let idx = selectedIndex {
                                    FilmDetailView(id: self.homeVM.arrFilmsData[idx]?.id)
                                }
                            }
                        }
                        .padding(.top)
                    }
                }
            }

            .onChange(of: self.homeVM.searchString, perform: { newValue in
                self.homeVM.filterData()
            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(Constant.APIString.kStarWars)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .padding(.bottom, 5)
                        .foregroundColor(Color.myDarkCustomColor)
                }
        }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

