//
//  Profile.swift
//  Tocca Mock
//
//  Created by Wenyuan Bao on 7/4/19.
//  Copyright © 2019 Wenyuan Bao. All rights reserved.
//

import UIKit

class Profile: NSObject {
    
    static var currentProfile: Profile? = nil

    var name: String
    var title: String
    var image: UIImage
    var qrCode: String

    init(_ name: String, _ title: String,_ image: UIImage, _ qrCode: String) {
        self.name = name
        self.title = title
        self.image = image
        self.qrCode = qrCode
    }
}
