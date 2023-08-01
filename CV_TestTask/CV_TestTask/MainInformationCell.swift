// MainInformationCell.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

class MainInformationCell: UICollectionViewCell {
    lazy var photoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = imageView.frame.height / 2
        return imageView
    }()

    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let locationView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        backgroundColor = .mainBackground
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(photoImageView)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        addSubview(locationView)
    }

    private func makeConstraints() {
        photoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
