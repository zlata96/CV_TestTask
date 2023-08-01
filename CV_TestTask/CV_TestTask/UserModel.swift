// UserModel.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

struct UserModel {
    let name: String
    let description: String
    let city: String
    let photo: UIImage = .init(named: "profilePhoto") ?? UIImage()
}
