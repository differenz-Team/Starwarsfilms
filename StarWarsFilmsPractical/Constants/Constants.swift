//
//  Constants.swift
//  StarWarsFilmsPractical
//
//  Created by differenz210 on 30/10/23.
//

import Foundation
import UIKit
import SwiftUI

// MARK: - Constant
class Constant {
    
    struct APIString {
        static let kStarWars: String                             = "Star Wars"
        static let kTitle: String                                = "Title"
        static let kOpeningCrawl: String                         = "Opening Crawl"
        static let kCharacters: String                           = "Characters"
        static let kFilmDetail: String                           = "Film Detail"
        static let kEpisodeID : String                           = "Episode Number"
    }
    
    // MARK: - App Font Size
    struct FontSize {
        static let _10FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 12 : 10
        static let _12FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 14 : 12
        static let _14FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 16 : 14
        static let _16FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 18 : 16
        static let _17FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 19 : 17
        static let _18FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 20 : 18
        static let _20FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 22 : 20
        static let _22FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 24 : 22
        static let _24FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 26 : 24
        static let _28FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 30 : 28
        static let _30FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 32 : 30
        static let _32FontSize: CGFloat                          = DeviceType.IsDeviceIPad ? 34 : 32
    }
}

// MARK: - iPhone devicetype
struct DeviceType {
    static let IS_IPHONE_4_OR_LESS      = ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5              = ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6              = ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P             = ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE_X              = ScreenSize.SCREEN_HEIGHT == 812.0
    static let IS_IPHONE_XMAX           = ScreenSize.SCREEN_HEIGHT == 896.0
    static let IS_PAD                   = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPAD                  = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    static let IS_IPAD_PRO              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    static let IsDeviceIPad             = IS_PAD || IS_IPAD || IS_IPAD_PRO ? true : false
}

extension Notification.Name {
    static let showAlert                    = Notification.Name("showAlert")
}

// MARK: - Color Extensions
extension Color {
    public static var myCustomColor: Color {
        return Color(UIColor(named: "uniColor")!)
    }
    
    public static var myDarkCustomColor: Color {
        return Color(UIColor(named: "darkUniColor")!)
    }
    
    public static var appSnippetsColor: Color {
        return Color(UIColor(named: "appSnippetsColor")!)
    }
    
    public static var appLoaderColor:Color {
        return Color(UIColor(named: "loaderColor")!)
    }
}


struct ResponseErrors {
    static let kBadRequestError         = "Bad Request"
}

// MARK: - Notification Name
extension Notification.Name {
    static let showIndicator                = Notification.Name("showIndicator")
}

// MARK: - iPhone Screensize
struct ScreenSize {
    static let SCREEN_WIDTH             = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT            = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH        = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH        = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}



// MARK: - Indicator
struct Indicator {
    static func show()  { NotificationCenter.default.post(name: .showIndicator, object: true) }
    static func hide() {  NotificationCenter.default.post(name: .showIndicator, object: false) }
}
