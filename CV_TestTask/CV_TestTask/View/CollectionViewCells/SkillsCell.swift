// SkillsCell.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - SkillsCell

class SkillsCell: UICollectionViewCell {
    enum SkillsState {
        case editing
        case regular
    }

    let cellState: SkillsState = .regular

    lazy var skillNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainTitle
        label.font = .text1R
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }()

    let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "crossIcon") ?? UIImage(), for: .normal)
        button.contentMode = .scaleToFill
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 24)
        button.backgroundColor = .mainBackground
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 48).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
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
        addSubviews()
        makeConstraints()
        setupStyle()
    }

    private func setupStyle() {
        layer.cornerRadius = 12
        backgroundColor = .mainBackground
    }

    private func addSubviews() {
        addSubview(skillNameLabel)
    }

    private func makeConstraints() {
        skillNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        skillNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        skillNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        skillNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
//        skillNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        skillNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        skillNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
//        skillNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = false
//
//        deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
//        deleteButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        deleteButton.leadingAnchor.constraint(equalTo: skillNameLabel.trailingAnchor).isActive = true

//        skillNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
//        skillNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }
}

// MARK: Configure

extension SkillsCell {
    func configuration(text: String) {
        skillNameLabel.text = text
    }
}
