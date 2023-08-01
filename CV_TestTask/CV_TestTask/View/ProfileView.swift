// ProfileView.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - ProfileView

class ProfileView: UIView {
    enum ProfileViewSections {
        case mainInfo
        case skills
        case aboutUser
    }

    let sections: [ProfileViewSections] = [.mainInfo, .skills, .aboutUser]
    lazy var profileCollectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(cellWithClass: MainInformationCell.self)
        collectionView.register(cellWithClass: SkillsCell.self)
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
        case .mainInfo:
            return createLayoutSingleSection(height: 700, isWithHeader: false)
        case .skills:
            return createLeftAlignedLayout()
        case .aboutUser:
            return createLayoutSingleSection(height: 300, isWithHeader: true)
        }
    }

    private func createLeftAlignedLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem( // this is your cell
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .estimated(64), // variable width
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
        let header = getHeader()
        section.boundarySupplementaryItems = [header]
        return section
    }

    private func createLayoutSingleSection(height: CGFloat, isWithHeader: Bool) -> NSCollectionLayoutSection {
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
        if isWithHeader {
            let header = getHeader()
            section.boundarySupplementaryItems = [header]
        }
        return section
    }

    private func getHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .topLeading)
        header.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 0, bottom: 0, trailing: 0)
        return header
    }
}
