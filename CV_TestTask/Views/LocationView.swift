// LocationView.swift
// CV_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - LocationView

class LocationView: UIView {
    let locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .mainBackground
        imageView.image = UIImage(named: "locationIcon") ?? UIImage()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .text1R
        label.textColor = .subTitle
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
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
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .mainBackground
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(cityNameLabel)
        addSubview(locationImageView)
    }

    private func makeConstraints() {
        cityNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cityNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        locationImageView.trailingAnchor.constraint(equalTo: cityNameLabel.leadingAnchor, constant: -4).isActive = true
        locationImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        locationImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        locationImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

extension LocationView {
    func configure(text: String) {
        cityNameLabel.text = text
    }
}
