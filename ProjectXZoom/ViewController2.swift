//
//  ViewController2.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 2/27/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit
extension UIImage {

    func addBackgroundCircle(_ color: UIColor?) -> UIImage? {

        let circleDiameter = max(size.width * 2, size.height * 2)
        let circleRadius = circleDiameter * 0.5
        let circleSize = CGSize(width: circleDiameter, height: circleDiameter)
        let circleFrame = CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height)
        let imageFrame = CGRect(x: circleRadius - (size.width * 0.5), y: circleRadius - (size.height * 0.5), width: size.width, height: size.height)

        let view = UIView(frame: circleFrame)
        view.backgroundColor = color ?? .systemRed
        view.layer.cornerRadius = circleDiameter * 0.5

        UIGraphicsBeginImageContextWithOptions(circleSize, false, UIScreen.main.scale)

        let renderer = UIGraphicsImageRenderer(size: circleSize)
        let circleImage = renderer.image { ctx in
            view.drawHierarchy(in: circleFrame, afterScreenUpdates: true)
        }

        circleImage.draw(in: circleFrame, blendMode: .normal, alpha: 1.0)
        draw(in: imageFrame, blendMode: .normal, alpha: 1.0)

        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return image
    }
}


typealias Animation = (UITableViewCell, IndexPath, UITableView) -> Void
final class Animator {
    private var hasAnimatedAllCells = false
    private let animation: Animation

    init(animation: @escaping Animation) {
        self.animation = animation
    }

    func animate(cell: UITableViewCell, at indexPath: IndexPath, in tableView: UITableView) {
        guard !hasAnimatedAllCells else {
            return
        }

        animation(cell, indexPath, tableView)

        //hasAnimatedAllCells = (tableView.visibleCells.last != nil)
    }
}


enum AnimationFactory {

    static func makeMoveUpWithBounce(rowHeight: CGFloat, duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    
    
    
    static func makeFadeAnimation(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, _ in
            cell.alpha = 0

            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                animations: {
                    cell.alpha = 1
            })
        }
    }
}

let defaults = UserDefaults.standard
var timeInput = UserDefaults.standard.mutableArrayValue(forKey: "timeInput")
var cur = UserDefaults.standard.integer(forKey: "cur")
var arrayOfArrays = UserDefaults.standard.mutableArrayValue(forKey: "savedArray")
let meetingsAttended = UserDefaults.standard.integer(forKey: "meetingsAttended")
var timesClicked = UserDefaults.standard.integer(forKey: "times")
var data = UserDefaults.standard.mutableArrayValue(forKey: "myKey")
var datalist = UserDefaults.standard.mutableArrayValue(forKey: "savedlinklist")
var datacolor = UserDefaults.standard.mutableArrayValue(forKey: "colors")
var times = UserDefaults.standard.mutableArrayValue(forKey: "times")
var arrayOfArrays2 = UserDefaults.standard.mutableArrayValue(forKey: "savedArray2")

var hasID = UserDefaults.standard.mutableArrayValue(forKey: "hasID")
var meetID = UserDefaults.standard.mutableArrayValue(forKey: "meetID")
var meetPass = UserDefaults.standard.mutableArrayValue(forKey: "meetPass")

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var cur = UserDefaults.standard.integer(forKey: "cur")
    
   
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    
    
  //  var meetingNames = ["Chemistry", "Statistics", "Physics", "English", "Calculus", "Orchestra"]
//    var i = -1
  //   var linkList = ["https://yahoo.com", "https://youtube.com"]
     var colorlist = ["0", "1", "2", "3", "4", "5", "0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5","0", "1", "2", "3", "4", "5"]

    
     func numberOfSections(in tableView: UITableView) -> Int {
        return //data.count
        data.count
     }
     
     // There is just one row in every section
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1
     }
     
     // Set the spacing between sections
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 25
     }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
     
     //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return(10)
    
    // }
     
    
    //func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
    //{
        // return "Your new title"
  //  }

    
    
      func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let closeAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            defaults.set(true, forKey: "tf")
            defaults.set(indexPath.section, forKey: "cur")
            
            if hasID[indexPath.section] as! Bool{
                
                self.performSegue(withIdentifier: "midToID", sender: self)
            }
            else{
                self.performSegue(withIdentifier: "midToLink", sender: self)
            }
            
                
            
            
                success(true)
            })
           // closeAction.image = UIImage(named: "tick")
          //  closeAction.backgroundColor = .purple

        if #available(iOS 13.0, *) {
            let largeConfig = UIImage.SymbolConfiguration(pointSize: 17.0, weight: .bold, scale: .large)
        
            closeAction.image = UIImage.init(systemName: "pencil", withConfiguration: largeConfig)?.withTintColor(.white, renderingMode: .alwaysTemplate).addBackgroundCircle(.systemIndigo)
               
               
        } else {
            // Fallback on earlier versions
        }
        closeAction.backgroundColor = UIColor.init(red: 100/255.0, green: 100/255.0, blue: 0/255.0, alpha: 0.0)
       closeAction.title = "Edit"
        
        
        
        let config = UISwipeActionsConfiguration(actions: [closeAction])
                             config.performsFirstActionWithFullSwipe = false

                            

                                return config
        
        
            

    }


    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        var actions = [UIContextualAction]()

        let delete = UIContextualAction(style: .normal, title: nil) { [weak self] (contextualAction, view, completion) in
            let center = UNUserNotificationCenter.current()
            
            center.removePendingNotificationRequests(withIdentifiers: arrayOfArrays[indexPath.section] as! [String]  )
            arrayOfArrays.removeObject(at: indexPath.section)
            print(arrayOfArrays)
            data.removeObject(at: indexPath.section)
            datalist.removeObject(at: indexPath.section)
            times.removeObject(at: indexPath.section)
            timeInput.removeObject(at: indexPath.section)
            
            arrayOfArrays2.removeObject(at: indexPath.section)
            
            hasID.removeObject(at: indexPath.section)
            meetID.removeObject(at: indexPath.section)
            meetPass.removeObject(at: indexPath.section)
            
               //  center.removeDeliveredNotifications(withIdentifiers: [data[indexPath.section] as! String])
            
            self?.myTableView.reloadData()

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

        let config = UISwipeActionsConfiguration(actions: actions)
        config.performsFirstActionWithFullSwipe = false

       

           return config
    }
    
    
    
    
    
    
    
    
    
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
         let cell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! MeetingTVCTableViewCell
         
        
        
       
        
        cell.meetingImg.image = UIImage(named: colorlist[indexPath.section])
        
        cell.meetingName.text = data[indexPath.section] as! String
       
        cell.meetingTimes.text = times[indexPath.section] as! String
       
        let animation = AnimationFactory.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 0.9, delayFactor: 0)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
        
        
         return(cell)
         
       
        
         
         
     }
     
     


     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")!
        
        
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
       
        
         
        if let url = URL(string: datalist[indexPath.section] as! String) {
                      if UIApplication.shared.canOpenURL(url) {
                          if #available(iOS 10.0, *) {
                              UIApplication.shared.open(url, options: [:], completionHandler: nil)
                          } else {
                              UIApplication.shared.openURL(url)
                          }
                      }
                  }
        
        
        
        
     }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(arrayOfArrays)
        defaults.set(false, forKey: "tf")
        myTableView.reloadData()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tableTapped))
               myTableView.addGestureRecognizer(tap)
        
  
    }
    
    @IBAction func addPlus(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Meeting", message: "Would you like to add a meeting through a meeting link or a meeting ID and password (second option is Zoom only)", preferredStyle: UIAlertController.Style.alert)

               // add the actions (buttons)
               alert.addAction(UIAlertAction(title: "Meeting Link", style: UIAlertAction.Style.default, handler: {ACTION in
                   
                   self.performSegue(withIdentifier: "midToLink", sender: self)
                   
                   
               }))
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Meeting ID", style: UIAlertAction.Style.default, handler: {ACTION in
            
            self.performSegue(withIdentifier: "midToID", sender: self)
            
            
        }))

               // show the alert
               self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    @objc func tableTapped(tap:UITapGestureRecognizer) {
            let location = tap.location(in: self.myTableView)
            let path = self.myTableView.indexPathForRow(at: location)
            if let indexPathForRow = path {
                
                defaults.incrementIntegerForKey(key: "meetingsAttended", by: 1)
                
                
                self.tableView(self.myTableView, didSelectRowAt: indexPathForRow)
                
                
                
                
            } else {
                performSegue(withIdentifier: "test", sender: self)
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
