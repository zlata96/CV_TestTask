// NavigationController.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
    }

    private func setupStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .mainBackground
        appearance.titleTextAttributes = [
            .font: UIFont.text1B,
            .foregroundColor: UIColor.mainTitle ?? .black
        ]
        navigationBar.standardAppearance = appearance
        view.backgroundColor = .mainBackground
    }
}
