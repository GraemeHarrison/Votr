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

    @IBOutlet var signUpButton: CTAButton!
    @IBOutlet var loginButton: CTAButton!
    @IBOutlet var logoYConstraint: NSLayoutConstraint!
    @IBOutlet var messageView: UIView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        signUpButton.style = .red
        signUpButton.style = .blue
        messageView.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)
        animateViewsForIntro()
    }

    private func animateViewsForIntro() {

        let offset: CGFloat = 120
        logoYConstraint.constant = -UIScreen.main.bounds.height/2 + offset

        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: { _ in

            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {

                self.messageView.alpha = 1

            }, completion: nil)
        })
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
