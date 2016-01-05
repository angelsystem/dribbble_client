//
//  ShotCell.swift
//  DribbbleShot
//
//  Created by angelito on 3/11/15.
//  Copyright (c) 2015 Angelito. All rights reserved.
//

import UIKit

class ShotCell: UICollectionViewCell {
    
    @IBOutlet weak var shotImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func prepareForReuse() {
        self.shotImage.image = nil
    }
    
}
