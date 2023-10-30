//
//  CustomViews.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import Foundation
import SwiftUI

extension View {
    func noDataFoundView() -> some View {
        VStack {
            Spacer()
            
            Image(systemName: IdentifiableKeys.ImageName.kPerson)
                .resizable()
                .frame(width: 40.0, height: 40.0, alignment: .center)
                .font(.system(size: Constant.FontSize._20FontSize))
            
            Text("No Data found!")
                .font(.system(size: Constant.FontSize._20FontSize))
            
            Spacer()
            
        }
    }
    
    func SearchBarView(searchString: Binding<String>, search: @escaping(() -> ())) -> some View {
        HStack {
            TextField("Search", text: searchString)
                .padding(.horizontal, 20)
                .lineLimit(2)
                .fontWeight(.bold)
                .padding(.bottom, 5)
                .foregroundColor(Color.myDarkCustomColor)
                .padding(.vertical, 10)
            
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 25, height: 25, alignment: .center)
                .onTapGesture {
                    search()
                }
        }
        .padding(.trailing, 20)
        .background(Color.appSnippetsColor)
        .cornerRadius(10)

    }
    @ViewBuilder
    func redacted(when condition: Bool) -> some View {
        if !condition {
            unredacted()
        } else {
            redacted(reason: .placeholder)
        }
    }
}

extension Alert {
    static func show(title: String = "", message: String = "") {
        NotificationCenter.default.post(name: .showAlert, object: AlertData(title: title, message: message))
    }
}

// MARK: - AlertData
class AlertData {
    
    static var empty = AlertData(title: "Sample", message: "Empty")
    
    var title: String
    var message: String
    
    private(set) var dismissButton: Alert.Button = .default(Text("OK"))
    private(set) var secondaryButton: Alert.Button = .default(Text("Yes"))
    private(set) var primaryButton: Alert.Button = .default(Text("No"))
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
        
        self.dismissButton = .default(Text("OK")) {
        }
        
        self.secondaryButton = .default(Text("Yes")) {
        }
    }
}
