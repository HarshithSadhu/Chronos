//
//  addTaskScreen.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 4/11/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit
import AVFoundation
 

class addTaskScreen: UIViewController {
    
    let remaininglist = UserDefaults.standard.mutableArrayValue(forKey: "remaining")
    
    var arrayOfArrays = UserDefaults.standard.mutableArrayValue(forKey: "savedArray")
    var arrayOfArrays2 = UserDefaults.standard.mutableArrayValue(forKey: "savedArray2")
    var data = UserDefaults.standard.mutableArrayValue(forKey: "myKey")
    var times = UserDefaults.standard.mutableArrayValue(forKey: "times")
    var timeInput = UserDefaults.standard.mutableArrayValue(forKey: "timeInput")
    var tf = UserDefaults.standard.bool(forKey: "tf")
    var datalist = UserDefaults.standard.mutableArrayValue(forKey: "savedlinklist")
    var cur = UserDefaults.standard.integer(forKey: "cur")
    
    
    var suntimes = 0;
    var montimes = 0;
    var tuetimes = 0;
    var wedtimes = 0;
    var thutimes = 0;
    var fritimes = 0;
    var sattimes = 0;
    
    
    @IBOutlet weak var mon: UIButton!
   
   
    @IBOutlet weak var tue: UIButton!
    @IBOutlet weak var wed: UIButton!
    @IBOutlet weak var thu: UIButton!
    @IBOutlet weak var fri: UIButton!
    var weekdaySet = [Int]()
    
    @IBOutlet weak var sat: UIButton!
    //var arrayOfArrays = defaults.array(forKey: "SavedArrayOfArrays") as [[String]]
  
    //make a 2d arrays of Uuid Strings and then remove the entire 1d array when deleteing at indexpath.section
    @IBOutlet weak var sun: UIButton!
    @IBAction func sun(_ sender: Any) {
        suntimes = suntimes + 1
        
        if(suntimes % 2 == 1){
        weekdaySet.append(1)
            sun.setTitleColor(UIColor.purple, for: .normal)
            
        }
        else{
            if let index = weekdaySet.index(of: 1) {
                weekdaySet.remove(at: index)
            }
            
            sun.setTitleColor(UIColor.white, for: .normal)
            
        }
        
        print(weekdaySet)
        
    }
    @IBAction func sat(_ sender: Any) {
        
        sattimes = sattimes + 1
        
        if(sattimes % 2 == 1){
        weekdaySet.append(7)
            sat.setTitleColor(UIColor.purple, for: .normal)
            
        }
        else{
            if let index = weekdaySet.index(of: 7) {
                weekdaySet.remove(at: index)
            }
            
            sat.setTitleColor(UIColor.white, for: .normal)
            
        }
        
        print(weekdaySet)
    }
    @IBAction func fri(_ sender: Any) {
        
        fritimes = fritimes + 1
        
        if(fritimes % 2 == 1){
        weekdaySet.append(6)
            fri.setTitleColor(UIColor.purple, for: .normal)
            
        }
        else{
            if let index = weekdaySet.index(of: 6) {
                weekdaySet.remove(at: index)
            }
            
            fri.setTitleColor(UIColor.white, for: .normal)
            
        }
        
        print(weekdaySet)
    }
    
    @IBAction func thu(_ sender: Any) {
        
        
        thutimes = thutimes + 1
        
        if(thutimes % 2 == 1){
        weekdaySet.append(5)
            thu.setTitleColor(UIColor.purple, for: .normal)
            
        }
        else{
            if let index = weekdaySet.index(of: 5) {
                weekdaySet.remove(at: index)
            }
            
            thu.setTitleColor(UIColor.white, for: .normal)
            
        }
        
        print(weekdaySet)
    }
    
    @IBAction func wed(_ sender: Any) {
        
        wedtimes = wedtimes + 1
        
        if(wedtimes % 2 == 1){
        weekdaySet.append(4)
            wed.setTitleColor(UIColor.purple, for: .normal)
            
        }
        else{
            if let index = weekdaySet.index(of: 4) {
                weekdaySet.remove(at: index)
            }
            
            wed.setTitleColor(UIColor.white, for: .normal)
            
        }
        
        print(weekdaySet)
    }
    @IBAction func mon(_ sender: Any) {
        
        montimes = montimes + 1
        
        if(montimes % 2 == 1){
        weekdaySet.append(2)
            mon.setTitleColor(UIColor.purple, for: .normal)
            
        }
        else{
            if let index = weekdaySet.index(of: 2) {
                weekdaySet.remove(at: index)
            }
            
            mon.setTitleColor(UIColor.white, for: .normal)
            
        }
        
        print(weekdaySet)
    }
    
    @IBAction func tue(_ sender: Any) {
        
        tuetimes = tuetimes + 1
        
        if(tuetimes % 2 == 1){
        weekdaySet.append(3)
            tue.setTitleColor(UIColor.purple, for: .normal)
            
        }
        else{
            if let index = weekdaySet.index(of: 3) {
                weekdaySet.remove(at: index)
            }
            
            tue.setTitleColor(UIColor.white, for: .normal)
            
        }
        
        print(weekdaySet)
    }
   
    @IBOutlet weak var addlbl: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if tf == true{
            addlbl.setTitle("Edit", for: UIControl.State.normal)
            
        }
        //print(arrayOfArrays2)
        let time = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "H:mm"
        datetxt.text = formatter.string(from: time)
        let timePicker = UIDatePicker()
        if #available(iOS 13.4, *) {
            timePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        timePicker.frame.size = CGSize(width: 0, height: 250)
        
        
        
        datetxt.inputView = timePicker
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timePickerValueChanged(sender:)), for: UIControl.Event.valueChanged )
        
        
        
        
        if tf == true{
            print(cur)
            MeetingName.text = data[cur] as! String
            MeetingLink.text = datalist[cur] as! String
            datetxt.text = timeInput[cur] as! String
            print(timeInput[cur])
            print(arrayOfArrays2[cur])
            weekdaySet = arrayOfArrays2[cur] as! [Int]
            for i in weekdaySet {
                if(i == 2){
                    mon.setTitleColor(UIColor.purple, for: .normal)
                    montimes = 1
                }
                if(i == 3){
                    tue.setTitleColor(UIColor.purple, for: .normal)
                    tuetimes = 1
                }
                if(i == 4){
                    wed.setTitleColor(UIColor.purple, for: .normal)
                    wedtimes = 1
                }
                if(i == 5){
                    thu.setTitleColor(UIColor.purple, for: .normal)
                    thutimes = 1
                }
                if(i == 6){
                    fri.setTitleColor(UIColor.purple, for: .normal)
                    fritimes = 1
                }
                if(i == 7){
                    sat.setTitleColor(UIColor.purple, for: .normal)
                    sattimes = 1
                }
                if(i == 1){
                    sun.setTitleColor(UIColor.purple, for: .normal)
                    suntimes = 1
                }
                
            }
            
            
        }
        
        
        
       let center = UNUserNotificationCenter.current()
                    
                 center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
                        }
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

       //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
       //tap.cancelsTouchesInView = false

       view.addGestureRecognizer(tap)
        
        
    }
    
    @objc func timePickerValueChanged(sender: UIDatePicker){
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "H:mm"
        datetxt.text = formatter.string(from: sender.date)
    }
    
    
    
    
    
    @IBOutlet weak var MeetingName: UITextField!

    @IBOutlet weak var MeetingLink: UITextField!

    @IBOutlet weak var datetxt: UITextField!
    
    
    @IBAction func add(_ sender: Any) {
        
        //data.add(MeetingName.text)
        //datalist.add(MeetingLink.text)
        if tf == true{
            defaults.set(false, forKey: "tf")
            let center = UNUserNotificationCenter.current()
            
            center.removePendingNotificationRequests(withIdentifiers: arrayOfArrays[cur] as! [String]  )
            
            timeInput[cur] = datetxt.text
                  
                  if weekdaySet.count > 0{
                          print("this worked")
                  
                      
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
                  
                  times[cur] = prettyhour + ":" + prettyminute + " " + light
                  
                  
                    arrayOfArrays2[cur] = weekdaySet
                  
                
              
                             let content = UNMutableNotificationContent()
                  
                  content.title = "Meeting Time!"
                      content.sound = UNNotificationSound.default
                      
                  content.body = "Your " + MeetingName.text! as String + " meeting starts at " + prettyhour + ":" + prettyminute + " " + light + "!"
                 
                             // Step 3: Create the notification trigger
                      var StringArray = [String]()
                      
                       for i in weekdaySet {
                                        var dateComponents = DateComponents()
                                       
                                       
                                     if(minute == 0 || minute == 1 || minute == 2 || minute == 3 || minute == 4){
                                         dateComponents.minute = 60 + minute! - 5
                                         if hour == 0{
                                             dateComponents.hour = 23
                                             if(i == 1){
                                                 dateComponents.weekday = 7
                                             }
                                             else{
                                             
                                             dateComponents.weekday = i - 1
                                             }
                                         }
                                         else{
                                             dateComponents.hour = hour! - 1;
                                             dateComponents.weekday = i
                                         }
                                         
                                     }
                                     else{
                                         
                                         dateComponents.minute = minute! - 5
                                          dateComponents.hour = hour;                         dateComponents.weekday = i
                                         
                                     }
                                     
                                        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                                    
                                    
                                        // Step 4: Create the request
                                    print(dateComponents)
                                        var uuidString = UUID().uuidString
                          StringArray.append(uuidString)
                                     let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                                    
                                        // Step 5: Register the request
                                        center.add(request) { (error) in
                                        // Check the error parameter and handle any errors
                                        }
                                 
                                    
                                 }
                      if weekdaySet.count == 0{
                          arrayOfArrays2[cur] = ([])
                          
                      }
                      else{
                      arrayOfArrays2[cur] = weekdaySet
                      }
                      print(StringArray)
                      
                      arrayOfArrays[cur] = (StringArray)
                      print(arrayOfArrays)
                  }else{
                      
                      
                      
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
                          
                          times[cur] = prettyhour + ":" + prettyminute + " " + light
                          
                          
                          
                      arrayOfArrays[cur] = ([])
                      
                  }
              
                  if weekdaySet.count == 0{
                      arrayOfArrays2[cur] = []
                      
                  }
                  else{
                  arrayOfArrays2[cur] = weekdaySet
                  }
                  data[cur] = MeetingName.text
                  datalist[cur] = MeetingLink.text
            
            
        }
        else{
        
        
        
        
        
        timeInput.add(datetxt.text)
        
        if weekdaySet.count > 0{
                print("this worked")
        
            
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
            content.sound = UNNotificationSound.default
            
        content.body = "Your " + MeetingName.text! as String + " meeting starts at " + prettyhour + ":" + prettyminute + " " + light + "!"
       
                   // Step 3: Create the notification trigger
            var StringArray = [String]()
            
             for i in weekdaySet {
                              var dateComponents = DateComponents()
                             
                             
                           if(minute == 0 || minute == 1 || minute == 2 || minute == 3 || minute == 4){
                               dateComponents.minute = 60 + minute! - 5
                               if hour == 0{
                                   dateComponents.hour = 23
                                   if(i == 1){
                                       dateComponents.weekday = 7
                                   }
                                   else{
                                   
                                   dateComponents.weekday = i - 1
                                   }
                               }
                               else{
                                   dateComponents.hour = hour! - 1;
                                   dateComponents.weekday = i
                               }
                               
                           }
                           else{
                               
                               dateComponents.minute = minute! - 5
                                dateComponents.hour = hour;                         dateComponents.weekday = i
                               
                           }
                           
                              let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                          
                          
                              // Step 4: Create the request
                          print(dateComponents)
                              var uuidString = UUID().uuidString
                StringArray.append(uuidString)
                           let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                          
                              // Step 5: Register the request
                              center.add(request) { (error) in
                              // Check the error parameter and handle any errors
                              }
                       
                          
                       }
            
            print(StringArray)
            
            arrayOfArrays.add(StringArray)
            print(arrayOfArrays)
        }else{
            
            
            
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
                
                
            arrayOfArrays.add([])
            
        }
    
        if weekdaySet.count == 0{
            arrayOfArrays2.add([])
            
        }
        else{
        arrayOfArrays2.add(weekdaySet)
        }
        data.add(MeetingName.text)
        datalist.add(MeetingLink.text)
    // elsetag
    }
        
        defaults.set(false, forKey: "tf")
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            textField.resignFirstResponder()

            return true

        }
        
    }
    @IBAction func back(_ sender: Any) {
        if data.count == 0 {
            performSegue(withIdentifier: "toFirst", sender: self)
        }
        else{
            performSegue(withIdentifier: "toMid2", sender: self)
        }
    }
    
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func done2(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

