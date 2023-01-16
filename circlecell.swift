//
//  circlecell.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 3/15/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class circlecell: UITableViewCell {
    @IBOutlet weak var circle: MBCircularProgressBarView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
