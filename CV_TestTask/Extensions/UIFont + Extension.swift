// UIFont + Extension.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

extension UIFont {
    static var text1B: UIFont {
        UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
    }

    static var text1M: UIFont {
        UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
    }

    static var text1R: UIFont {
        UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
    }

    static var text2B: UIFont {
        UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
    }
}
