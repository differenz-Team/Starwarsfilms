//
//  StarWarsFilmsPracticalApp.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import SwiftUI

@main
struct StarWarsFilmsPracticalApp: App {
    @State private var showIndicator: Bool = false
    @State private var showAlert: Bool = false
    @State private var alert: AlertData = AlertData.empty

    var body: some Scene {
        WindowGroup {
            HomeView()
                .onReceive(NotificationCenter.default.publisher(for: .showIndicator)) { result in
                    if let showIndicator = result.object as? Bool {
                        self.showIndicator = showIndicator
                    }
                }
                .activityIndicator(show: self.showIndicator)
                .onReceive(NotificationCenter.default.publisher(for: .showAlert)) { result in
                    if let alert = result.object as? AlertData {
                        self.alert = alert
                        self.showAlert = true
                    }
                }
                .alert(isPresented: self.$showAlert) {
                    if self.alert.isLogOut {
                        return Alert(title: Text(self.alert.title), message: Text(self.alert.message), primaryButton: self.alert.primaryButton, secondaryButton: .default(Text("Yes")) {
                        })
                    } else {
                        if self.alert.message == "Authentication token has expired." {
                            return Alert(
                                title: Text(self.alert.title), message: Text(self.alert.message),
                                dismissButton: .default(Text("OK"), action: {
                                })
                            )
                        } else {
                            return Alert(title: Text(self.alert.title), message: Text(self.alert.message), dismissButton: self.alert.dismissButton)
                        }
                    }
                }
        }
    }
}
