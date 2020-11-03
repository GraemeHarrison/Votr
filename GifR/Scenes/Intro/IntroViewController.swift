//
//  IntroViewController.swift
//  GifR
//
//  Created by Graeme Harrison on 2020-11-02.
//

import UIKit

class IntroViewController: UIViewController {

    enum Segue: String {

        case showSignUp
        case showLogin
    }

    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signUpTapped(_ sender: Any) {
        launchOnboardingViewController(for: .signUp)
    }

    @IBAction func loginTapped(_ sender: Any) {
        launchOnboardingViewController(for: .login)
    }

    private func launchOnboardingViewController(for startMode: OnboardingStartMode) {

        let sb = UIStoryboard(name: "Onboarding", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! OnboardingViewController
        vc.setParameters(startMode: startMode, delegate: nil)
        navigationController?.show(vc, sender: nil)
    }
}
