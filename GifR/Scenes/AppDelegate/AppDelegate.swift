//
//  AppDelegate.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        FirebaseApp.configure()
        configureGlobalNavBar()
        return true
    }

    private func configureGlobalNavBar() {

        let titleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.blue, .font: UIFont.bold]
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = UIColor.blue
        appearance.titleTextAttributes = titleAttributes
    }
}
