//
//  Reminders.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 3/15/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit
import MBCircularProgressBar
//var itemsremaining = UserDefaults.standard.mutableArrayValue(forKey: "myKey")


extension UserDefaults {
    func incrementIntegerForKey(key:String, by: Int) {
        let int = integer(forKey: key)
        set(int + by, forKey:key)
    }
}



var savedpercent = defaults.double(forKey: "percent")
let tasksCompleted = UserDefaults.standard.integer(forKey: "tasksCompleted")

class Reminders: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    @IBOutlet weak var esc: UIButton!
    @IBOutlet weak var txtfield: UITextField!
    @IBOutlet weak var popup: UIImageView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var todo: UITableView!
    
    // I can make this var remainingraw = [String]()
    var remainingraw = ["Drivers Test", "Play Football", "Play Violin", "SAT Class"]
    
    var completedraw = [String]()
    let remaininglist = UserDefaults.standard.mutableArrayValue(forKey: "remaining")
    
    let completedlist = UserDefaults.standard.mutableArrayValue(forKey: "completed")
    
      
  
    
      func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
          var actions = [UIContextualAction]()

          let delete = UIContextualAction(style: .normal, title: nil) { [weak self] (contextualAction, view, completion) in
           
            if(self!.remaininglist.count == 0){
                self?.completedlist.removeObject(at: indexPath.section - 3)
                
                
            }
            else{
            
            if(indexPath.section > self!.remaininglist.count + 3){
                self?.completedlist.removeObject(at: indexPath.section - 4 - (self?.remaininglist.count)!)
                
            }
            else{
                let item = self?.remaininglist[indexPath.section - 3]
                self?.completedlist.add(item!)
                defaults.incrementIntegerForKey(key: "tasksCompleted", by: 1)
                self?.remaininglist.removeObject(at: indexPath.section - 3)
                
                
              
            }
                
            }
            //if(self!.remaininglist.count > 0 && self!.completedlist.count == 0){
            //    let item = self?.remaininglist[indexPath.section]
          // self?.completedlist.append(item!)
        //   self?.remaininglist.remove(at: indexPath.section)
      //  }
            //  defaults.set(self?.list, forKey: "myKey")
           self?.todo.reloadData()

              completion(true)
          }
        
        if #available(iOS 13.0, *) {
            let largeConfig = UIImage.SymbolConfiguration(pointSize: 17.0, weight: .bold, scale: .large)
       
    
            delete.image = UIImage(systemName: "trash", withConfiguration: largeConfig)?.withTintColor(.white, renderingMode: .alwaysTemplate).addBackgroundCircle(.systemRed)
        } else {
            // Fallback on earlier versions
        }
          delete.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
          delete.title = "Delete"

          actions.append(delete)

          
          
        var swipeAction = UISwipeActionsConfiguration(actions: actions)
        swipeAction.performsFirstActionWithFullSwipe = false
        if indexPath.section == 0{
            swipeAction = UISwipeActionsConfiguration(actions: [])
        }
        if indexPath.section == 1{
            swipeAction = UISwipeActionsConfiguration(actions: [])
        }
        if indexPath.section == 2{
            swipeAction = UISwipeActionsConfiguration(actions: [])
        }
        if remaininglist.count == 0{
            
        }
        else if indexPath.section == 3 + remaininglist.count{
            swipeAction = UISwipeActionsConfiguration(actions: [])
        }

           return swipeAction
        }
      
      
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 //return height size whichever you want
    }
    
   
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        
        
        if(remaininglist.count > 0 && completedlist.count == 0){
            if(indexPath.section == 0){
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell1") as! first
                
                 todo.rowHeight = 78
                 return(cell)
                 
            }
            
            
             if(indexPath.section == 1){
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell2") as! circlecell
                 todo.rowHeight = 205
                 
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                    
                          self.dec()
                    savedpercent = defaults.double(forKey: "percent")
                                   UIView.animate(withDuration: 1){
                                   cell.circle.value = CGFloat(savedpercent)
                                   }
                               }
                
                
                 
                 return(cell)
                 
             }
             if(indexPath.section == 2){
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell3") as! itemsRemainingCell
                            todo.rowHeight = 51
                     
                            return(cell)
                 
             }
             
             
                 
                 
            // if(indexPath.section >= 3 && indexPath.section < 3 + remaininglist.count){
             else{
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell4") as! tdcell
                                       todo.rowHeight = 106
                cell.lbl.text = remaininglist[indexPath.section - 3] as! String
                                       return(cell)
                 
             }
            
            
            
            
            
            
        }
        
        if(remaininglist.count > 0 && completedlist.count > 0){
            
            if(indexPath.section == 0){
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell1") as! first
                 
                 todo.rowHeight = 78
                 return(cell)
                 
            }
             if(indexPath.section == 1){
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell2") as! circlecell
                 todo.rowHeight = 205
                 
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                self.dec()
                    savedpercent = defaults.double(forKey: "percent")
                    
                    UIView.animate(withDuration: 1){
                    cell.circle.value = CGFloat(savedpercent)
                    }
                }
                
                
                 
                 return(cell)
                 
             }
             if(indexPath.section == 2){
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell3") as! itemsRemainingCell
                            todo.rowHeight = 51
                     
                            return(cell)
                 
             }
             
             
                 
                 
              if(indexPath.section >= 3 && indexPath.section < 3 + remaininglist.count){
                             
                             let cell = todo.dequeueReusableCell(withIdentifier: "cell4") as! tdcell
                                                   todo.rowHeight = 106
                cell.lbl.text = remaininglist[indexPath.section - 3] as! String
                
                
                
                
                
                
                                                   return(cell)
                             
                         }
             
             if(indexPath.section == 3 + remaininglist.count){
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell5") as! itemscompl
                                                  todo.rowHeight = 43
                                           
                                                  return(cell)
                 
                 
             }
             
             else{
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell6") as! jcomp
                        todo.rowHeight = 106
                
                cell.lbl.text = completedlist[indexPath.section - 4 - remaininglist.count] as! String
                 
                        return(cell)
             }
            
            
            
            
            
            
        }
        
        if(remaininglist.count == 0 && completedlist.count > 0){
            if(indexPath.section == 0){
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell1") as! first
                 
                 todo.rowHeight = 78
                 return(cell)
                 
            }
             if(indexPath.section == 1){
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell2") as! circlecell
                 todo.rowHeight = 205
                 
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                    self.dec()
                    savedpercent = defaults.double(forKey: "percent")
                                   UIView.animate(withDuration: 1){
                                   cell.circle.value = CGFloat(savedpercent)
                                   }
                               }
                
                 
                 return(cell)
                 
             }
             if(indexPath.section == 2){
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell5") as! itemscompl
                            todo.rowHeight = 51
                     
                            return(cell)
                 
             }
             
             
                 
                 
           // if(indexPath.section >= 3 && indexPath.section < 3 + completedlist.count){
            else{
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell6") as! jcomp
                                       todo.rowHeight = 106
                cell.lbl.text = completedlist[indexPath.section - 3] as! String
                                       return(cell)
                 
             }
        }
        
        else{
            if(indexPath.section == 0){
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell1") as! first
                 
                 todo.rowHeight = 78
                 return(cell)
                 
            }
             else{
                 
                 let cell = todo.dequeueReusableCell(withIdentifier: "cell2") as! circlecell
                 todo.rowHeight = 205
                 
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.10) {
                    self.dec()
                    savedpercent = defaults.double(forKey: "percent")
                             
                                   UIView.animate(withDuration: 1){
                                   cell.circle.value = CGFloat(savedpercent)
                                   }
                               }
                
                 
                 return(cell)
                 
             }
        }
        
        //////////////////////////////////////////////////////////////////////// / / /
        
        
        
        
        
        
        
        
        
        
    
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
         
        // return 3 + ItemsRemaning.count + 1 + Items Completed.count
        
        // Hard Code Cells 1 and 2
        // if itemsremaining.count > 0{
        // hard code cell 3 and repeat cell 4
        
        //if itemscompleted.count> 0{
        // hard code cell 5 and repeat cell 6
        
        if(remaininglist.count > 0 && completedlist.count == 0){
            return 3 + remaininglist.count
        }
        
        if(remaininglist.count > 0 && completedlist.count > 0){
            return 3 + remaininglist.count + 1 + completedlist.count
        }
        
        if(remaininglist.count == 0 && completedlist.count > 0){
            return 3 + completedlist.count
        }
        
        else{
            return 2
        }
        
     }
     
     // There is just one row in every section
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
     }
     
     // Set the spacing between sections
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 10
     }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dec()
        
        savedpercent = defaults.double(forKey: "percent")
        
         defaults.set(remainingraw, forKey: "remaininglist")
        defaults.set(completedraw, forKey: "completedlist")
        
    }
    
    
    
    
    
    
    func dec() {
        let test = Double(completedlist.count)
        
        var percentcomplete: Double = test/Double((completedlist.count + remaininglist.count)) * 100
        
        if(completedlist.count + remaininglist.count == 0){
            percentcomplete = 0.0
        }
        
        
      
        
        
        defaults.set(percentcomplete, forKey: "percent")
    }

    
    
    @IBAction func addtask(_ sender: Any) {
        
        UIView.transition(with: popup, duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.popup.isHidden = false
        })
        
        UIView.transition(with: blur, duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.blur.isHidden = false
        })
        
        UIView.transition(with: txtfield, duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.txtfield.isHidden = false
        })
        
        //blur.isHidden = false
        //popup.isHidden = false
        //txtfield.isHidden = false
        esc.isHidden = false
        
    }
    
    @IBAction func Escape(_ sender: Any) {
        
        if(txtfield.text != "")
        {
            remaininglist.add(txtfield.text)
        }
        
        view.endEditing(true)
        
       
        
        
        UIView.transition(with: popup, duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.popup.isHidden = true
        })
        
        UIView.transition(with: blur, duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.blur.isHidden = true
        })
        
        UIView.transition(with: txtfield, duration: 0.4,
            options: .transitionCrossDissolve,
            animations: {
                self.txtfield.isHidden = true
        })
        todo.reloadData()
        esc.isHidden = true
        txtfield.text = ""
        
    }
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
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
