// MainInformationCell.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - MainInformationCell

class MainInformationCell: UICollectionViewCell {
    lazy var photoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .text2B
        label.textColor = .mainTitle
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .text1R
        label.textColor = .subTitle
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let locationView = LocationView()

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
        photoImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true

        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true

        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true

        locationView.centerXAnchor.constraint(equalTo: descriptionLabel.centerXAnchor).isActive = true
        locationView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4).isActive = true
        // TODO:
//        locationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        locationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
}

// MARK: Configure

extension MainInformationCell {
    func configure(user: UserModel) {
        photoImageView.image = user.photo
        nameLabel.text = user.name
        descriptionLabel.text = user.description
        locationView.configure(text: user.city)
    }
}
