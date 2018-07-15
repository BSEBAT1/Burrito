//
//  AppDelegate.swift
//  NoStoryBoard
//
//  Created by macbook pro on 6/17/18.
//  Copyright © 2018 Sebat. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    // swiftlint:disable:next line_length
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        window?.makeKeyAndVisible()

        window?.rootViewController = UINavigationController(rootViewController: ViewController())

        GMSPlacesClient.provideAPIKey("AIzaSyDiA2NljQxLUyHy0jVeFyuW3TohieNQiyc")

        GMSServices.provideAPIKey("AIzaSyDiA2NljQxLUyHy0jVeFyuW3TohieNQiyc")

        return true
    }
        // swiftlint:disable:next line_length
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {

        return UIInterfaceOrientationMask.portrait
    }
}
