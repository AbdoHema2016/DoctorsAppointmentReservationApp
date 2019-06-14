//
//  BasicInfoVC.swift
//  Doc
//
//  Created by Abdelrhman on 12/5/17.
//  Copyright © 2017 bigNerdeo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class BasicInfoVC: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    @IBOutlet weak var changeLang: UIButton!
    func arabicLang(alert: UIAlertAction!){
        //change app language
        UserDefaults.standard.set(["ar"], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
    }
    
    func englishLang(alert: UIAlertAction!){
        //change app language
        UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        
    }
    let preferredLanguage = NSLocale.preferredLanguages[0]
    @IBAction func changeLang(_ sender: UIButton) {
        
        //Relaunch for Changes to take effect
        
        //showing an alert to notify the user about restarting the app for language changes to take effect
        if Bundle.main.preferredLocalizations.first == "en" {
            let alert = UIAlertController(title: "Change Language", message: "Relaunch for Changes to take effect", preferredStyle: UIAlertControllerStyle.alert)
            let arabicAction = UIAlertAction(title: "Ok",
                                             style: .default, handler: arabicLang)
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .cancel, handler: nil)
            alert.addAction(arabicAction)
            alert.addAction(cancelAction)
            alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
            self.present(alert, animated: true, completion: nil)
            
            
            
            
            
        }else{
            let alert = UIAlertController(title: "تغيير اللغه", message: "أعد الفتح لتفعيل التغييرات", preferredStyle: UIAlertControllerStyle.alert)
            
            let englishAction = UIAlertAction(title: "حسنا",
                                              style: .default, handler: englishLang)
            let cancelAction = UIAlertAction(title: "إلغاء",
                                             style: .cancel, handler: nil)
            alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
            alert.addAction(englishAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
            
            
            
        }
        
    }
    
    
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        fullName_txtField.resignFirstResponder()
        birthDate_txtField.resignFirstResponder()
        jobTitle_txtField.resignFirstResponder()
        phoneNumber_txtField.resignFirstResponder()
        state_txtField.resignFirstResponder()
        address_txtField.resignFirstResponder()
        
        
    }
    
    
    var ref = Database.database().reference().child("Patients")
    let user = Auth.auth().currentUser
    var values = [String : Any]()
    
    
    @IBOutlet weak var birthDate_txtField: UITextField!
    @IBOutlet weak var fullName_txtField: UITextField!
    
    @IBOutlet weak var jobTitle_txtField: UITextField!
    @IBOutlet weak var phoneNumber_txtField: UITextField!
    @IBOutlet weak var state_txtField: UITextField!
    @IBOutlet weak var address_txtField: UITextField!
    @IBOutlet weak var internetConnection: UILabel!
    //object for the internet connectivity reachability class
    let reachability = MyReachability()!
    func internetChanged(note: Notification) {
        
        let reachability = note.object as! MyReachability
        if reachability.isReachable{
            if reachability.isReachableViaWiFi{
                DispatchQueue.main.async {
                    
                    self.internetConnection.isHidden = true
                    /*
                     if Auth.auth().currentUser != nil {
                     // User is signed in.
                     // ...
                     if let user = self.user {
                     // The user's ID, unique to the Firebase project.
                     // Do NOT use this value to authenticate with your backend server,
                     // if you have one. Use getTokenWithCompletion:completion: instead.
                     let uid = user.uid
                     let displayName = user.displayName
                     let photoURL = user.photoURL?.absoluteString
                     let email = user.email
                     print(uid)
                     print(email!)
                     // self.userName.text = displayName
                     //self.userEmail.text = email
                     
                     let url = URL(string: photoURL!)
                     if let data = try? Data(contentsOf: url!) {//make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                     // self.userImage.image = UIImage(data: data)
                     //userImage.do
                     print(photoURL!)
                     // ...
                     }
                     }
                     
                     
                     }*/
                    
                }
            }else{
                DispatchQueue.main.async {
                    
                    self.internetConnection.isHidden = true
                    /*if Auth.auth().currentUser != nil {
                     // User is signed in.
                     // ...
                     if let user = self.user {
                     // The user's ID, unique to the Firebase project.
                     // Do NOT use this value to authenticate with your backend server,
                     // if you have one. Use getTokenWithCompletion:completion: instead.
                     let uid = user.uid
                     let displayName = user.displayName
                     let photoURL = user.photoURL?.absoluteString
                     let email = user.email
                     print(uid)
                     print(email!)
                     self.userName.text = displayName
                     self.userEmail.text = email
                     
                     let url = URL(string: photoURL!)
                     if let data = try? Data(contentsOf: url!) {//make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                     self.userImage.image = UIImage(data: data)
                     //userImage.do
                     print(photoURL!)
                     // ...
                     }
                     }
                     
                     
                     }*/
                    
                }
            }
        }else{
            DispatchQueue.main.async {
                
                self.internetConnection.isHidden = false
            }
        }
    }
    @IBAction func next_Btn(_ sender: UIButton) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = self.fullName_txtField.text ?? "Name Missing"
        changeRequest?.commitChanges { (error) in
            print(error.debugDescription)
        }
        
        self.values = ["age":self.birthDate_txtField.text!,"fullName":self.fullName_txtField.text!,"jobTitle":self.jobTitle_txtField.text!,"phoneNumber":self.phoneNumber_txtField.text!,"state":self.state_txtField.text!,"address":self.address_txtField.text!]
        
        
        self.ref.child((user?.uid)!).updateChildValues(self.values, withCompletionBlock: { (error, snapshot) in
            if error != nil {
                print("oops, an error")
            } else {
                print("completed")
                
            }
        })
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil) //Write your storyboard name
        let viewController = storyboard.instantiateViewController(withIdentifier: "TBC")
        UIApplication.shared.keyWindow?.rootViewController = viewController
        self.dismiss(animated: true, completion: nil)
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        if Bundle.main.preferredLocalizations.first == "en" {
            changeLang.setTitle("Arabic",for: .normal)
            
            
        }
        else{
            changeLang.setTitle("English",for: .normal)
            
        }
        reachability.whenReachable = { _ in
            DispatchQueue.main.async {
                
                self.internetConnection.isHidden = true
            }
            
        }
        reachability.whenUnreachable = { _ in
            DispatchQueue.main.async {
                
                self.internetConnection.isHidden = false
            }
            
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged ), name: ReachabilityChangedNotification, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("couldn't start notifier")
        }
        //let finalUID = (user?.uid)!
    }
    
    
}
