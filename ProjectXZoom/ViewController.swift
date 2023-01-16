//
//  ViewController.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 2/27/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit
import MBCircularProgressBar
public extension UIDevice {

    static let model: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod touch (5th generation)"
            case "iPod7,1":                                 return "iPod touch (6th generation)"
            case "iPod9,1":                                 return "iPod touch (7th generation)"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPhone11,2":                              return "iPhone XS"
            case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
            case "iPhone11,8":                              return "iPhone XR"
            case "iPhone12,1":                              return "iPhone 11"
            case "iPhone12,3":                              return "iPhone 11 Pro"
            case "iPhone12,5":                              return "iPhone 11 Pro Max"
            case "iPhone12,8":                              return "iPhone SE (2nd generation)"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad (3rd generation)"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad (4th generation)"
            case "iPad6,11", "iPad6,12":                    return "iPad (5th generation)"
            case "iPad7,5", "iPad7,6":                      return "iPad (6th generation)"
            case "iPad7,11", "iPad7,12":                    return "iPad (7th generation)"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad11,4", "iPad11,5":                    return "iPad Air (3rd generation)"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad mini 4"
            case "iPad11,1", "iPad11,2":                    return "iPad mini (5th generation)"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro (9.7-inch)"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
            case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch) (1st generation)"
            case "iPad8,9", "iPad8,10":                     return "iPad Pro (11-inch) (2nd generation)"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro (12.9-inch) (1st generation)"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
            case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
            case "iPad8,11", "iPad8,12":                    return "iPad Pro (12.9-inch) (4th generation)"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }

        return mapToDevice(identifier: identifier)
    }()

}



class ViewController: UIViewController {
    
    @IBOutlet weak var tasklbl: UILabel!
    var times = UserDefaults.standard.mutableArrayValue(forKey: "times")
    var openned = UserDefaults.standard.integer(forKey: "open")
    var tasksCompleted = UserDefaults.standard.integer(forKey: "tasksCompleted")
    var meetingsAttended = UserDefaults.standard.integer(forKey: "meetingsAttended")
    let tf3 = UserDefaults.standard.bool(forKey: "tf3")
   // var firstDate = UserDefaults.standard.object(forKey: "date") as! Date
    var tf = UserDefaults.standard.bool(forKey: "tf")
    @IBOutlet weak var meetinglbl: UILabel!
    
    @IBAction func bbb(_ sender: Any) {
        if data.count == 0 {
            
            let alert = UIAlertController(title: "Add Meeting", message: "Would you like to add a meeting through a meeting link or a meeting ID and password (second option is Zoom only)", preferredStyle: UIAlertController.Style.alert)

                   // add the actions (buttons)
                   alert.addAction(UIAlertAction(title: "Meeting Link", style: UIAlertAction.Style.default, handler: {ACTION in
                       
                       self.performSegue(withIdentifier: "toEnd", sender: self)
                       
                       
                   }))
            
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Meeting ID", style: UIAlertAction.Style.default, handler: {ACTION in
                
                self.performSegue(withIdentifier: "firstToID", sender: self)
                
                
            }))

                   // show the alert
                   self.present(alert, animated: true, completion: nil)
            
        
        }
        else{
            performSegue(withIdentifier: "toMid", sender: self)
        }
        
    }
    
    @IBOutlet weak var pertask: UILabel!
    @IBOutlet weak var bubble: UIButton!
    @IBOutlet weak var Dashboard: UIImageView!
    @IBOutlet weak var Rect2: UIImageView!
    @IBOutlet weak var black2: UIButton!
    
    @IBOutlet weak var permeeting: UILabel!
    @IBOutlet weak var rect1: UIImageView!
    @IBOutlet weak var MeetingName: UILabel!
    @IBOutlet weak var MeetingTime: UILabel!
    
    var cur = UserDefaults.standard.integer(forKey: "cur")
    @IBOutlet weak var Tasks: UILabel!
    @IBOutlet weak var black: UIButton!
    @IBOutlet weak var analytics: UILabel!
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if tf3 == false{
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            
            if let bundleID = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: bundleID)
            }
            defaults.set(true, forKey: "tf3")
        }
            //let domain = Bundle.main.bundleIdentifier!
            //UserDefaults.standard.removePersistentDomain(forName: domain)
            //UserDefaults.standard.synchronize()
        
        
        defaults.set(false, forKey: "tf")
        let modelName = UIDevice.model
        
        
        if modelName == "Simulator iPhone SE (2nd generation)" || modelName == "Simulator iPhone X" || modelName == "Simulator iPhone 7" || modelName == "Simulator iPhone 8" || modelName == "Simulator iPhone 6" || modelName == "Simulator iPhone 6s" || modelName == "Simulator iPhone XS"{
            let Constraint6 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: tasklbl, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 83)
            
            let Constraint7 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: meetinglbl, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 81)
                      
            
            let Constraint8 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rect1, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 80)
            
             let Constraint9 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: Rect2, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 80)
             
            NSLayoutConstraint.activate([Constraint6, Constraint7, Constraint8, Constraint9])
            
        }
             
        
        if modelName == "Simulator iPhone SE" || modelName == "Simulator iPhone 5s"{
        let Constraint9 = NSLayoutConstraint(item: bubble, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: Dashboard, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 25)
            
            let Constraint10 = NSLayoutConstraint(item: MeetingName, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: Dashboard, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 48)
            
            let Constraint11 = NSLayoutConstraint(item: MeetingTime, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: Dashboard, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 85)
            
            let Constraint6 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: tasklbl, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 62)
            
            let Constraint7 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: meetinglbl, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 61)
                      
            
            let Constraint8 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rect1, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 60)
            
             let Constraint12 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: Rect2, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 60)
            
            let Constraint13 = NSLayoutConstraint(item: analytics, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: black, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 50)
             let Constraint14 = NSLayoutConstraint(item: black2, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: black, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 30)
            let Constraint15 = NSLayoutConstraint(item: black, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bubble, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 30)
            let Constraint16 = NSLayoutConstraint(item: Tasks, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bubble, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 45)
             let Constraint17 = NSLayoutConstraint(item: progressView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: bubble, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 48)
            let Constraint18 = NSLayoutConstraint(item: view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: progressView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 45)
            
            meetinglbl.font = meetinglbl.font.withSize(16)
            tasklbl.font = meetinglbl.font.withSize(16)
            pertask.font = meetinglbl.font.withSize(10)
            permeeting.font = meetinglbl.font.withSize(10)
            progressView.valueFontSize = 20
            progressView.unitFontSize = 20
            
            NSLayoutConstraint.activate([Constraint6, Constraint7, Constraint8, Constraint9, Constraint10, Constraint11, Constraint12, Constraint13, Constraint14, Constraint15, Constraint16, Constraint17, Constraint18])
    }
        
        let diffInDays = 1
        
        if let firstOpen = UserDefaults.standard.object(forKey: "FirstOpen") as? Date {
            let diffInDays = Calendar.current.dateComponents([.day], from: firstOpen, to: Date()).day
        } else {
            // This is the first launch
            UserDefaults.standard.set(Date(), forKey: "FirstOpen")
            let diffInDays = 0
        }
      
        if(diffInDays == 0){
            if(tasksCompleted < 10){
                tasklbl.text = "0" + String(tasksCompleted)
            }
            else{
            tasklbl.text = String(tasksCompleted)
            }
        }
        else{
           let pretty = tasksCompleted/diffInDays
            if(pretty < 10){
                tasklbl.text = "0" + String(pretty)
            }
            else{
            tasklbl.text = String(pretty)
            }
            
            
        }
       
        
        if(diffInDays == 0){
            if(meetingsAttended < 10){
                meetinglbl.text = "0" + String(meetingsAttended)
            }
            else{
           meetinglbl.text = String(meetingsAttended)
            }
        }
        else{
           let pretty = meetingsAttended/diffInDays
            if(pretty < 10){
                meetinglbl.text = "0" + String(meetingsAttended)
            }
            else{
            meetinglbl.text = String(meetingsAttended)
            }
            
            
        }
        print("here")
        print(diffInDays)
        print(meetingsAttended)
       
        
        
        
        if (data.count > 0) {
            MeetingName.text = data[0] as! String
        }
            
        if(times.count > 0){
            MeetingTime.text = times[0] as! String
        }
        
        let data = UserDefaults.standard.mutableArrayValue(forKey: "remaining")
        
        
        
        // code to bypass very first time the user opens
        if(data.count > 0)
        {
            
            if(data.count == 1){
                dot2.isHidden = true
                lbl2.isHidden = true
                dot3.isHidden = true
                lbl3.isHidden = true
                lbl1.text = data[0] as? String
            
            }
            
            
            if (data.count == 2) {
                dot3.isHidden = true
                lbl3.isHidden = true
                
                lbl1.text = data[0] as? String
                lbl2.text = data[1] as? String
                
            }
            
            if(data.count >= 3){
                
                lbl1.text = data[0] as? String
                lbl2.text = data[1] as? String
                lbl3.text = data[2] as? String
            }
            
        
        }
        else{
            
            dot2.isHidden = true
            dot3.isHidden = true
            lbl2.isHidden = true
            lbl3.isHidden = true
        }
        
        
        
        self.progressView.value = 0
        
        
        
        
        
    }
    @IBOutlet weak var dot1: UIImageView!
    @IBOutlet weak var dot2: UIImageView!
    @IBOutlet weak var dot3: UIImageView!
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
  
    
    
    
    override func viewWillAppear(_ animated: Bool){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
        
            let savedpercent = defaults.double(forKey: "percent")
            
            
            UIView.animate(withDuration: 1){
            self.progressView.value = CGFloat(savedpercent)
            }
        }
    }
    
    
    
    

}

