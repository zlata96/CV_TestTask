// ProfileViewController.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - ProfileViewController

class ProfileViewController: UIViewController, UITextFieldDelegate {
    // swiftlint:disable all
    let contentView = ProfileView()
    var skillsArray = [String]()

    let user = UserModel(
        name: "Иванов Иван \nИванович",
        description: "Middle iOS-разработчик, опыт более 2-х лет",
        city: "Воронеж"
    )

    let aboutMeText = "Experienced software engineer skilled in developing scalable and maintainable systemsExperienced software engineer skilled in developing scalable and maintainable systemsExperienced software engineer skilled in developing scalable and maintainable systemsExperienced software engineer skilled in developing scalable and maintainable systems"
    // swiftlint:enable all
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view = contentView
        setupDelegates()
        setupData()
    }

    func setupDelegates() {
        contentView.profileCollectionView.dataSource = self
        contentView.profileCollectionView.delegate = self
    }

    func setupData() {
        contentView.configure(user: user)
        getDataFromUserDefaults()
    }

    func saveDataToUserDefaults() {
        let arrayToSave = skillsArray
        UserDefaults.standard.set(arrayToSave, forKey: "UserSkills")
    }

    func getDataFromUserDefaults() {
        if let loadedArray = UserDefaults.standard.array(forKey: "UserSkills") as? [String] {
            skillsArray = loadedArray
        } else {
            skillsArray = ["MVVM", "WorkManager", "Room", "OOP and SOLID", "dsfahgelwfgalfrghalerhf", "dsfahgelwfgalfrghalerhfdsfahgelwfgalfrghalerhf"]
        }
    }
}

// MARK: UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return skillsArray.count
        case 1:
            return 1
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withClass: SkillsCell.self, for: indexPath)
            cell.configuration(text: skillsArray[indexPath.row])
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withClass: AboutMeCell.self, for: indexPath)
            cell.configuration(text: aboutMeText)
            return cell
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeader.reuseIdentifier,
            for: indexPath
        ) as? SectionHeader else { fatalError("Cannot create the header") }
        header.editButtonDelegate = self

        switch indexPath.section {
        case 0: header.configure(title: "Мои навыки", isButtonHidden: false)
        case 1: header.configure(title: "О себе", isButtonHidden: true)
        default: break
        }
        return header
    }
}

// MARK: EditButtonDelegate

extension ProfileViewController: EditButtonDelegate {
    func editButtonPressed(currentState: SectionHeader.HeaderState) {
        if currentState == .standard {
            skillsArray.append("+")
            changeCellsState(state: .editing)
            contentView.profileCollectionView.insertItems(at: [IndexPath(row: skillsArray.count - 1, section: 0)])
        } else {
            skillsArray.removeLast()
            contentView.profileCollectionView.deleteItems(at: [IndexPath(row: skillsArray.count, section: 0)])
            changeCellsState(state: .regular)
            saveDataToUserDefaults()
        }
    }

    func changeCellsState(state: SkillsCell.SkillsState) {
        for index in 0 ... skillsArray.count - 1 {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = contentView.profileCollectionView.cellForItem(at: indexPath) as? SkillsCell
            cell?.cellState = state

            if skillsArray[indexPath.row] == "+" {
                cell?.cellState = .regular
            }
        }
    }
}

// MARK: UICollectionViewDelegate

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = skillsArray.count - 1
        if skillsArray[index] == "+" {
            if indexPath.row == index {
                presentAlert()
            } else {
                skillsArray.remove(at: indexPath.row)
                // changeCellsState(state: .editing)
                contentView.profileCollectionView.deleteItems(at: [indexPath])
            }
        } else {
            return
        }
    }

    func presentAlert() {
        let alert = UIAlertController(
            title: "Добавление навыка",
            message: "Введите название навыка, которым вы владеете", preferredStyle: UIAlertController.Style.alert
        )

        alert.addTextField { (textField: UITextField!) in
            textField.placeholder = "Введите название навыка"
            textField.delegate = self
        }

        let save = UIAlertAction(
            title: "Добавить",
            style: UIAlertAction.Style.default,
            handler: { [weak self] _ in
                let textField = alert.textFields![0] as UITextField
                self?.skillsArray.insert(textField.text ?? "", at: (self?.skillsArray.count ?? 1) - 1)
                self?.contentView.profileCollectionView.reloadData()
                self?.saveDataToUserDefaults()
            }
        )

        let cancel = UIAlertAction(
            title: "Отмена",
            style: UIAlertAction.Style.default,
            handler: { _ in
                alert.dismiss(animated: true)
            }
        )

        alert.addAction(cancel)
        alert.addAction(save)

        present(alert, animated: true)
    }
}
