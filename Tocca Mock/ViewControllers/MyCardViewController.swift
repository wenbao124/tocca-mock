//
//  MyCardViewController.swift
//  Tocca Mock
//
//  Created by Wenyuan Bao on 7/4/19.
//  Copyright © 2019 Wenyuan Bao. All rights reserved.
//

import UIKit

class MyCardViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var scanQRButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var myProfileView: MyProfileView!

    let profile: Profile?
    
    init(profile: Profile?) {
        self.profile = profile
        super.init(nibName: nil, bundle: nil)
        tabBarItem = UITabBarItem(title: "My Card", image: UIImage(), tag: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scanQRButton.setImage(UIImage(), for: .normal)
        scanQRButton.backgroundColor = .white
        scanQRButton.layer.cornerRadius = 35
        shareButton.backgroundColor = .white
        shareButton.layer.cornerRadius = 35
        myProfileView.layer.cornerRadius = 15
        myProfileView.profile = profile
        
    }
}