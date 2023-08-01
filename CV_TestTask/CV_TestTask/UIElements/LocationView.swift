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
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        return imageView
    }()

    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .text1R
        label.textColor = .subTitle
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(locationImageView)
        stackView.addArrangedSubview(cityNameLabel)
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 2
        return stackView
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
        addSubview(stackView)
    }

    private func makeConstraints() {
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

//        locationImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
//        locationImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
//        locationImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
//
//        cityNameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        cityNameLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor).isActive = true
//        cityNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}

extension LocationView {
    func configure(text: String) {
        cityNameLabel.text = text
    }
}
