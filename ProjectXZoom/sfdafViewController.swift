//
//  sfdafViewController.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 4/23/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit

class sfdafViewController: UIViewController {
   
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      let modelName = UIDevice.model
        if modelName == "Simulator iPhone SE"{
          img.autoresizingMask = []
            img.frame.size.height = 10.0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
