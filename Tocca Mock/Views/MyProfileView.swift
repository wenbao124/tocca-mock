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
        return imageView
    }()

    let qrView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
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

    func setupUI() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 8).isActive = true


        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 8).isActive = true

        addSubview(qrView)
        qrView.translatesAutoresizingMaskIntoConstraints = false
        qrView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        qrView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        qrView.widthAnchor.constraint(equalTo: qrView.heightAnchor).isActive = true
        qrView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 8).isActive = true
        qrView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
    }

    func configure(with profile: Profile?) {
        guard let profile = profile else { return }
        profileImageView.image = profile.image
        nameLabel.text = profile.name
        titleLabel.text = profile.title
    }
}