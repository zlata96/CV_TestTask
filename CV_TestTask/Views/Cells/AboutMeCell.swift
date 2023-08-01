// AboutMeCell.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - AboutMeCell

class AboutMeCell: UICollectionViewCell {
    lazy var aboutMeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainTitle
        label.font = .text1R
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.2
        label.attributedText = NSMutableAttributedString(string: label.text ?? "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
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
        backgroundColor = .white
    }

    private func addSubviews() {
        addSubview(aboutMeDescriptionLabel)
    }

    private func makeConstraints() {
        aboutMeDescriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        aboutMeDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        aboutMeDescriptionLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}

// MARK: Configure

extension AboutMeCell {
    func configuration(text: String) {
        aboutMeDescriptionLabel.text = text
    }
}
