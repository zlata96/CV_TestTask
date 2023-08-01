// SkillsCell.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

class SkillsCell: UICollectionViewCell {
    lazy var skillNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainTitle
        label.font = .text1R
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
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
//        skillNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        skillNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        skillNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        skillNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        skillNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        skillNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }

    func configuration(text: String) {
        skillNameLabel.text = text
    }
}
