// SectionHeader.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - EditButtonDelegate

protocol EditButtonDelegate: AnyObject {
    func editButtonPressed()
}

// MARK: - SectionHeader

class SectionHeader: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeader"

    enum HeaderState {
        case editing
        case standard

        var image: UIImage {
            switch self {
            case .editing:
                return UIImage(named: "completedIcon") ?? UIImage()
            case .standard:
                return UIImage(named: "editIcon") ?? UIImage()
            }
        }
    }

    var headerState: HeaderState = .standard {
        didSet {
            editButton.setImage(headerState.image, for: .normal)
        }
    }

    var editButtonDelegate: EditButtonDelegate?
    private var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .text1M
        label.textColor = .mainTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(headerState.image, for: .normal)
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        setupTargets()
    }

    private func setupStyle() {
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(categoryNameLabel)
        addSubview(editButton)
    }

    private func makeConstraints() {
        categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        categoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        categoryNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true

        editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        editButton.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        editButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func setupTargets() {
        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
    }

    @objc
    func editButtonPressed() {
        editButtonDelegate?.editButtonPressed()
    }

    func configure(title: String, isButtonHidden: Bool) {
        categoryNameLabel.text = title
        editButton.isHidden = isButtonHidden
    }
}
