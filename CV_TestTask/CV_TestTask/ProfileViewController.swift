// ProfileViewController.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - ProfileViewController

class ProfileViewController: UIViewController {
    let contentView = ProfileView()
    let skillsArray = ["MVVM", "WorkManager", "Room", "OOP and SOLID", "dsfahgelwfgalfrghalerhf", "dsfahgelwfgalfrghalerhfdsfahgelwfgalfrghalerhf"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view = contentView
        setupDelegates()
    }

    func setupDelegates() {
        contentView.profileCollectionView.dataSource = self
    }
}

// MARK: UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        skillsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: SkillsCell.self, for: indexPath)
        cell.configuration(text: skillsArray[indexPath.row])
        return cell
    }
}
