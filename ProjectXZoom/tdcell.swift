//
//  tdcell.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 3/15/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit

class tdcell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
