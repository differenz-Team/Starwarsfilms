//
//  FilmDetailView.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import SwiftUI

///`FilmDetailView`
struct FilmDetailView: View {
    var id: String?
    @StateObject private var filmDetailVM: FilmsDetailViewModel = FilmsDetailViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        ZStack{
            VStack {
                if !self.filmDetailVM.lblNoDataFoundHidden {
                    noDataFoundView()
                } else {
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                TextCell(text: "\(Constant.APIString.kTitle) : \(self.filmDetailVM.filmDetail?.title ?? "")")
                            }
                            TextCell(text: "\(Constant.APIString.kEpisodeID): \(self.filmDetailVM.filmDetail?.episodeID ?? 0)", isFixed: true)

                            TextCell(text: "\(Constant.APIString.kOpeningCrawl) : \(self.filmDetailVM.filmDetail?.openingCrawl ?? "")")

                            TextCell(text: "\(Constant.APIString.kCharacters) : ", isFixed: true)

                            ScrollView(.horizontal,showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< (self.filmDetailVM.filmDetail?.characterConnection?.characters?.count ?? 0), id: \.self) { i in
                                        TextCell(
                                            text: self.filmDetailVM.filmDetail?.characterConnection?.characters?[i]?.name ?? "",
                                            fontWeight: .regular,
                                            color: .gray.opacity(10)
                                        )
                                    }

                                }
                            }
                        }
                        
                        .padding(.all)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    }
                    .redacted(when: filmDetailVM.isDataLoading)

                    .navigationBarBackButtonHidden()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .foregroundColor(.myDarkCustomColor)
                            }

                        }
                        
                        ToolbarItem(placement: .principal) {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                TextCell(text: Constant.APIString.kFilmDetail, showBG: false)
                            }
                            
                        }
                    }
                }
            }
            .frame(maxWidth: ScreenSize.SCREEN_WIDTH, maxHeight: .infinity, alignment: .top)

        }
        .onAppear {
            self.filmDetailVM.getFilmsDetailData(id: id ?? "")
        }
    }
}

struct FilmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailView(id: "ZmlsbXM6MQ==")
    }
}

///`FilmsDetailView`
extension FilmDetailView {
    func TextCell(text: String, fontWeight: Font.Weight = .bold, color: Color = .myDarkCustomColor, showBG: Bool = true, isFixed: Bool = false) -> some View {
        Text(text)
            .font(.headline)
            .padding(.bottom, 5)
            .foregroundColor(color)
            .frame(maxWidth: !isFixed ? .infinity : nil, alignment: .leading)
            .padding(.all)
            .background(showBG ? Color.appSnippetsColor : nil)
            .cornerRadius(10)
    }
}
