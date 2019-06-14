//
//  ReservationVC.swift
//  Doc
//
//  Created by Abdelrhman on 3/29/18.
//  Copyright © 2018 bigNerdeo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import UserNotifications

class ReservationVC: UIViewController{
    
     var ref = Database.database().reference().child("Appoitments")
    var finalDate = ""
    var finalPeriod = ""
    var children = UInt()
    var nextInLine = UInt()
    let user = Auth.auth().currentUser
    @IBOutlet weak var chosenAppointment_Lbl: UILabel!
    var values = [String : Any]()
     @IBOutlet weak var firstDate_Lbl: UILabel!
    @IBOutlet weak var secondDate_Lbl: UILabel!
    @IBOutlet weak var thirdDate_Lbl: UILabel!
    @IBOutlet weak var fourthDate_Lbl: UILabel!
    @IBOutlet weak var fifthDate_Lbl: UILabel!
    @IBOutlet weak var sixthDate_Lbl: UILabel!
    @IBOutlet weak var seventhDate_Lbl: UILabel!
    
    override func viewDidLoad() {
        
        let firstdate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        let firstDateresult = formatter.string(from: firstdate)
        firstDate_Lbl.text = firstDateresult
        
        let secondDate = Calendar.current.date(byAdding: .day, value: 1, to: firstdate)
        let secondDateResult = formatter.string(from: secondDate!)
        secondDate_Lbl.text = secondDateResult
        
        let thirdDate = Calendar.current.date(byAdding: .day, value: 2, to: firstdate)
        let thirdDateResult = formatter.string(from: thirdDate!)
        thirdDate_Lbl.text = thirdDateResult
        
        let fourthDate = Calendar.current.date(byAdding: .day, value: 3, to: firstdate)
        let fourthDateResult = formatter.string(from: fourthDate!)
        fourthDate_Lbl.text = fourthDateResult
        
        let fifthDate = Calendar.current.date(byAdding: .day, value: 4, to: firstdate)
        let fifthDateResult = formatter.string(from: fifthDate!)
        fifthDate_Lbl.text = fifthDateResult
        
        let sixthDate = Calendar.current.date(byAdding: .day, value: 5, to: firstdate)
        let sixthDateResult = formatter.string(from: sixthDate!)
        sixthDate_Lbl.text = sixthDateResult
        
        let seventhDate = Calendar.current.date(byAdding: .day, value: 6, to: firstdate)
        let seventhDateResult = formatter.string(from: seventhDate!)
        seventhDate_Lbl.text = seventhDateResult
        
        
    }
   
    func confirmed(){
        let alert = UIAlertController(title: "Confirm",
                                      message: " at Day",
            preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Ok",
                                          style: .default, handler: nil)
        self.chosenAppointment_Lbl.text = "asdasdas"
        
        alert.addAction(confirmAction)
        
        alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(alert, animated: true)
    }
    func confirmation(alert: UIAlertAction!){
        
        self.ref.child(finalDate).child(finalPeriod).child("l").updateChildValues(self.values, withCompletionBlock: { (error, snapshot) in
            if error != nil {
                print("oops, an error")
            } else {
                print("completed")
               self.confirmed()
            }
        })
        
        
    }
    @IBOutlet weak var firstDay_Btn: UIButton!
    func alert(){
        let alert = UIAlertController(title: "Confirm",
                                      message: "\(firstDate_Lbl.text!) at Day",
            preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Ok",
                                          style: .default, handler: confirmation)
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: nil)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        present(alert, animated: true)
        
    }
    func setLabel(){
        
        
    }
    func checkChildren(){
        self.ref.child(finalDate).child(finalPeriod).observe(.value, with: { (dataSnapshot) in
            self.children = dataSnapshot.childrenCount
            if self.children > 2 {
                self.chosenAppointment_Lbl.text = "sds"
            }
            
        })
    }
    @IBAction func firstDay_Btn(_ sender: UIButton) {
        finalDate = firstDate_Lbl.text!
        finalPeriod = "Night"
        self.values = ["UId":user?.uid ?? "user"]
       
        alert()
        
        checkChildren()
         chosenAppointment_Lbl.text = "you "
        
    }
    
    @IBOutlet weak var firstNight_Btn: UIButton!
    
    @IBAction func firstNight_Btn(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var secondDay_Btn: UIButton!
    
    @IBAction func secondDay_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var secondNight_Btn: UIButton!
    
    @IBAction func secondNight_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var thirdDay_Btn: UIButton!
    
    @IBAction func thirdDay_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var thirdNight_Btn: UIButton!
    
    @IBAction func thirdNight_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var fourthDay_Btn: UIButton!
    
    @IBAction func fourthDay_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var fourthNight_Btn: UIButton!
    
    @IBAction func fourthNight_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var fifthDay_Btn: UIButton!
    
    @IBAction func fifthDay_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var fifthNight_Btn: UIButton!
    
    @IBAction func fifthNight_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var sixthDay_Btn: UIButton!
    
    @IBAction func sixthDay_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var sixthNight_Btn: UIButton!
    
    @IBAction func sixthNight_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var seventhDay_Btn: UIButton!
    
    @IBAction func seventhDay_Btn(_ sender: UIButton) {
    }
    
    @IBOutlet weak var seventhNight_Btn: UIButton!
    
    @IBAction func seventhNight_Btn(_ sender: UIButton) {
    }
    
    
    
    
}

