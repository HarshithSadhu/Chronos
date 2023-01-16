//
//  ToDolistViewController.swift
//  ProjectXZoom
//
//  Created by Harshith Sadhu on 3/13/21.
//  Copyright © 2021 Harshith Sadhu. All rights reserved.
//

import UIKit

class ToDolistViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var todo: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //   if(indexPath.section != 2){
            let cell = todo.dequeueReusableCell(withIdentifier: "cell") as! ToDoListTableViewCell
            
            return(cell)
     //   }
        //else{
           // let cell = todo.dequeueReusableCell(withIdentifier: "cell2") as! SecondCellTable
            
            
          //  return(cell)
            
        //}
        
        
        
        
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
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

        // Do any additional setup after loading the view.
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
