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

        UIApplication.shared.statusBarStyle = .lightContent

        let titleAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.voteRed, .font: UIFont.bold]
        let appearance = UINavigationBar.appearance()
        appearance.titleTextAttributes = titleAttributes
        appearance.tintColor = .voteBlue
        appearance.shadowImage = UIImage()
        appearance.setBackgroundImage(UIImage(), for: .default)
        appearance.isTranslucent = true
    }
}
