// ProfileView.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - ProfileView

class ProfileView: UIView {
    enum ProfileViewSections {
        case skills
        case aboutUser
    }

    let sections: [ProfileViewSections] = [.skills, .aboutUser]
    private let mainInformationView = MainInformationView()
    lazy var profileCollectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: SkillCell.self)
        collectionView.register(cellWithClass: AboutMeCell.self)
        collectionView.register(viewWithClass: SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
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
        mainInformationView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupStyle() {
        backgroundColor = .mainBackground
    }

    private func addSubviews() {
        addSubview(mainInformationView)
        addSubview(profileCollectionView)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            mainInformationView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            mainInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainInformationView.heightAnchor.constraint(greaterThanOrEqualToConstant: UIScreen.main.bounds.width * 0.7),

            profileCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileCollectionView.topAnchor.constraint(equalTo: mainInformationView.bottomAnchor),
            profileCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 700),
            profileCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ProfileView {
    func createLayout() -> UICollectionViewLayout {
        let viewSections = sections
        let sectionProvider: UICollectionViewCompositionalLayoutSectionProvider = { [weak self] sectionIndex, _ ->
            NSCollectionLayoutSection? in
            let section = viewSections[sectionIndex]
            let layout = self?.layoutSection(for: section)
            return layout
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        layout.configuration.scrollDirection = .vertical
        return layout
    }

    private func layoutSection(for type: ProfileViewSections) -> NSCollectionLayoutSection {
        switch type {
        case .skills:
            return createLeftAlignedLayout()
        case .aboutUser:
            return createLayoutSingleSection(height: 300)
        }
    }

    private func createLeftAlignedLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .estimated(64),
                heightDimension: .absolute(44)
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(56)
            ),
            subitems: [item]
        )
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        group.interItemSpacing = .fixed(12)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        let header = getHeader()
        section.boundarySupplementaryItems = [header]
        return section
    }

    private func createLayoutSingleSection(height: CGFloat) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.4)
            )
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(height)
            ),
            subitems: [item]
        )
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        let header = getHeader()
        section.boundarySupplementaryItems = [header]

        return section
    }

    private func getHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
        header.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0)
        return header
    }

    func configure(user: UserModel) {
        mainInformationView.configure(user: user)
    }
}
