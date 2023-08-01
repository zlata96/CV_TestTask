// ProfileView.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - ProfileView

class ProfileView: UIView {
    lazy var profileCollectionView: UICollectionView = {
        let layout = createLeftAlignedLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: SkillsCell.self)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .mainBackground
    }

    private func addSubviews() {
        addSubview(profileCollectionView)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            profileCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileCollectionView.rightAnchor.constraint(equalTo: rightAnchor),
            profileCollectionView.topAnchor.constraint(equalTo: topAnchor),
            profileCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ProfileView {
    private func createLeftAlignedLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem( // this is your cell
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .estimated(40), // variable width
                heightDimension: .absolute(44) // fixed height
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0), // 100% width as inset by its Section
                heightDimension: .estimated(56) // variable height; allows for multiple rows of items
            ),
            subitems: [item]
        )
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        group.interItemSpacing = .fixed(12) // horizontal spacing between cells
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        return UICollectionViewCompositionalLayout(section: section)
    }
}
