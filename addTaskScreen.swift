//
//  addTaskScreen.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 4/11/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit

class addTaskScreen: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let time = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "H:mm"
        datetxt.text = formatter.string(from: time)
        let timePicker = UIDatePicker()
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.frame.size = CGSize(width: 0, height: 250)
        
        
        
        datetxt.inputView = timePicker
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged )
        
        
    }
    
    @objc func timePickerValueChanged(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "H:mm"
        datetxt.text = formatter.string(from: sender.date)
    }
    let remaininglist = UserDefaults.standard.mutableArrayValue(forKey: "remaining")
    
    var data = UserDefaults.standard.mutableArrayValue(forKey: "myKey")
    var times = UserDefaults.standard.mutableArrayValue(forKey: "times")
    
    var datalist = UserDefaults.standard.mutableArrayValue(forKey: "savedlinklist")
   
    @IBOutlet weak var MeetingName: UITextField!

    @IBOutlet weak var MeetingLink: UITextField!

    @IBOutlet weak var datetxt: UITextField!
    
    
    @IBAction func add(_ sender: Any) {
        
        data.add(MeetingName.text)
        datalist.add(MeetingLink.text)
        
        
        let center = UNUserNotificationCenter.current()
               
                   center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                   }
        var hourraw = String()
        let time = datetxt.text
        
        if (time?.count == 4){
            hourraw = time!.substring(to:time!.index(time!.startIndex, offsetBy: 1));
        }
        else{
        hourraw = time!.substring(to:time!.index(time!.startIndex, offsetBy: 2));
        }
        
        
        
        
        let minutesraw = time!.substring(from:time!.index(time!.endIndex, offsetBy: -2))
            let hour = Int(hourraw)
        let minute = Int(minutesraw)
        print(hour)
        print(minute)
                
        var prettyhour = String()
        var prettyminute = String()
        var light = String()
        if(hour! > 12){
           prettyhour = String(hour! - 12)
            light = "PM"
        }
        else{
           prettyhour = String(hour! + 0)
            light = "AM"
        }
        if(minute! < 10){
            
            prettyminute = "0\(minute ?? 0)"
        }
        else{
            prettyminute = String(minute! + 0)
        
        }
        
        if(prettyhour == "0"){
            prettyhour = "12"
        }
        
        times.add(prettyhour + ":" + prettyminute + " " + light
        )
        
        
        
      
    
                   let content = UNMutableNotificationContent()
        
        content.title = "Meeting Time!"
        content.body = "Your " + MeetingName.text! as String + " meeting starts at " + prettyhour + ":" + prettyminute + " " + light + "!"
       
                   // Step 3: Create the notification trigger
               
                   var dateComponents = DateComponents()
                 //  dateComponents.weekday = weekday
                   dateComponents.hour = hour
                   dateComponents.minute = minute
                   let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
               
               
                   // Step 4: Create the request
               
                   let uuidString = UUID().uuidString
               
                   let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
               
                   // Step 5: Register the request
                   center.add(request) { (error) in
                   // Check the error parameter and handle any errors
                   }
               
               
               
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  

}
