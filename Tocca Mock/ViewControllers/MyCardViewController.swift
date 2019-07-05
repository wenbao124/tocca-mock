//
//  MyCardViewController.swift
//  Tocca Mock
//
//  Created by Wenyuan Bao on 7/4/19.
//  Copyright © 2019 Wenyuan Bao. All rights reserved.
//

import UIKit
import AssetsLibrary

class MyCardViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var scanQRButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var myProfileView: MyProfileView!
    let benzierPath = UIBezierPath()

    let profile: Profile?

    init(profile: Profile?) {
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "user_male"), tag: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        shareButton.backgroundColor = .white
        shareButton.layer.cornerRadius = 35
        shareButton.layer.shadowColor = UIColor.black.cgColor
        shareButton.layer.shadowOpacity = 0.5
        shareButton.layer.shadowOffset = .zero
        shareButton.layer.shadowRadius = 6
        shareButton.layer.shouldRasterize = true
        shareButton.layer.rasterizationScale = UIScreen.main.scale

        scanQRButton.setImage(UIImage(), for: .normal)
        scanQRButton.backgroundColor = .white
        scanQRButton.layer.cornerRadius = 35
        scanQRButton.layer.shadowColor = UIColor.black.cgColor
        scanQRButton.layer.shadowOpacity = 0.5
        scanQRButton.layer.shadowOffset = .zero
        scanQRButton.layer.shadowRadius = 6
        scanQRButton.layer.shouldRasterize = true
        scanQRButton.layer.rasterizationScale = UIScreen.main.scale

        myProfileView.layer.cornerRadius = 15
        myProfileView.profile = profile

        shareButton.setImage(UIImage(named: "upload-symbol"), for: .normal)
        scanQRButton.addTarget(self, action: #selector(scanQRButtonPressed), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let blueViewBackgroundColor = blueView.backgroundColor else { return }
        benzierPath.move(to: CGPoint(x: 0, y: blueView.frame.height))
        benzierPath.addQuadCurve(to: CGPoint(x: blueView.frame.width, y: blueView.frame.height), controlPoint: CGPoint(x: blueView.frame.width / 2 , y: blueView.frame.height + 40 ))
        benzierPath.close()
        let blueViewLayer = CAShapeLayer()
        blueViewLayer.path = benzierPath.cgPath
        blueViewLayer.fillColor = blueViewBackgroundColor.cgColor
        blueView.layer.insertSublayer(blueViewLayer, at: 0)
    }

    @objc private func scanQRButtonPressed() {
        //     Open camera and scan QR CODE
    }

    @objc private func shareButtonPressed() {
        //     Share the profile through network requests.
    }
}
