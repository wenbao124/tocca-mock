//
//  MyProfileView.swift
//  Tocca Mock
//
//  Created by Wenyuan Bao on 7/4/19.
//  Copyright © 2019 Wenyuan Bao. All rights reserved.
//

import UIKit

class MyProfileView: UIView {

    var profile: Profile? = nil {
        didSet {
            configure(with: profile)
        }
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "helvetica-bold", size: 25)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "helvetica", size: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        return imageView
    }()

    let outerView: UIView = {
        let outerView = UIView()
        outerView.backgroundColor = .blue
        outerView.layer.cornerRadius = 35
        outerView.clipsToBounds = false
        return outerView
    }()

    let qrImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    init(profile: Profile?) {
        self.profile = profile
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        self.profile = nil
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        addSubview(outerView)
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        outerView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        outerView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        outerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: outerView.bottomAnchor, constant: 4).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 8).isActive = true


        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 8).isActive = true

        addSubview(qrImageView)
        qrImageView.translatesAutoresizingMaskIntoConstraints = false
        qrImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        qrImageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        qrImageView.widthAnchor.constraint(equalTo: qrImageView.heightAnchor).isActive = true
        qrImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 8).isActive = true
        qrImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5).isActive = true
    }

    private func configure(with profile: Profile?) {
        guard let profile = profile else { return }
        profileImageView.image = profile.image
        nameLabel.text = profile.name
        titleLabel.text = profile.title
        let data = profile.qrCode.data(using: .isoLatin1, allowLossyConversion: false)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "InputMessage")
        let ciImage = filter?.outputImage
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let transformImage = ciImage?.transformed(by: transform)
        if let transformImage = transformImage {
            qrImageView.image = UIImage(ciImage: transformImage)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        outerView.layer.shadowColor = UIColor.black.cgColor
        outerView.layer.shadowOpacity = 0.5
        outerView.layer.shadowOffset = .zero
        outerView.layer.shadowRadius = 6
        outerView.layer.shouldRasterize = true
        outerView.layer.rasterizationScale = UIScreen.main.scale
        outerView.addSubview(profileImageView)
        profileImageView.frame = outerView.bounds
    }
}
