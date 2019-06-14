//
//  HistoryVC.swift
//  Doc
//
//  Created by Abdelrhman on 3/29/18.
//  Copyright © 2018 bigNerdeo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

//individual user/pateint history
class HistoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
     let user = Auth.auth().currentUser
    @IBAction func Back(_ sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TBC") as! UITabBarController
        self.present(newViewController, animated: true, completion: nil)
    }
    @IBOutlet weak var previousAppointmentsTV: UITableView!
    var ref = Database.database().reference().child("Patients")
   
    var historyList = [DataSnapshot]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "previousAppointmentCell", for: indexPath) as! ProfileCell
        
        let model = historyList[indexPath.row]
        if let value = model.value as? [String:Any]{
            if let text = value["visitDate"] as? String{
                cell.textLabel!.text = text
                
                
            }
            
            if let text = value["visitType"] as? String{
                cell.detailTextLabel!.text = text
                
                
            }
            
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let model = historyList[indexPath.row]
        if let value = model.value as? [String:Any]{
            //finalAppointmentDate = model.key
            
            
            if let Diagnosis = value["Diagnosis"] as? String{
                finalDiagnosis = Diagnosis
                
            }
            
            if let Actions = value["Actions"] as? String{
                finalActions = Actions
            }
            
            if let Notes = value["Notes"] as? String{
                finalNotes = Notes
            }
            
            
            if let Medications = value["Medications"] as? String{
                finalMedications = Medications
            }
            
            if let Date = value["visitDate"] as? String{
                finalDate = Date
            }
            
            if let Type = value["visitType"] as? String{
                finalVisitType = Type
            }
            
            
            
        }
        
        
        performSegue(withIdentifier: "IndividualAppointmentSegue", sender: self)
        /*
         
         let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
         let newViewController = storyBoard.instantiateViewController(withIdentifier: "IndividualAppointmentVC")
         self.present(newViewController, animated: true, completion: nil)
         */
        print(finalDiagnosis)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //ref =  self.ref.child((user?.uid)!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let user = self.user {
            print("the user",user.uid)
            
            ref.child(user.uid).child("History").observeSingleEvent(of: .value, with: { snapshot in
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    self.historyList.append(snap)
                    
                    
                    
                    print(snapshot)
                    
                    //}
                    
                    print(snap)
                    
                }
                
               self.previousAppointmentsTV.reloadData()
            })
           
        }
        
//        ref.observe(.childAdded, with: { (snapshot) in
//            //if let items = snapshot.value as? [String:Any]{
//            
//            
//            self.historyList.append(snapshot)
//            
//            
//            
//            
//            
//            //}
//            self.previousAppointmentsTV.reloadData()
//        })
        
        // Do any additional setup after loading the view.
        
    }

    
    
}
