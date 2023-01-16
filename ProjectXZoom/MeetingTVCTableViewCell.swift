//
//  MeetingTVCTableViewCell.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 2/27/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit

class MeetingTVCTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        

    
    }
    
    

        

    
    

    
   
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12324
    }
    
    @IBOutlet weak var MeetingView: UIView!
    @IBOutlet weak var meetingImg: UIImageView!
    
    @IBOutlet weak var meetingTimes: UILabel!
    @IBOutlet weak var meetingName: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
