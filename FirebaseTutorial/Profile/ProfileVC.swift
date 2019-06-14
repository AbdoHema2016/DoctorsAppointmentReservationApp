//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by James Dacombe on 16/11/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class ProfileVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var TableArray = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            print("section = 0")
        }
        if(section == 1){
            print("section = 1")
        }
        if(section == 2){
            print("section = 2")
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var age_Lbl: UILabel!
    @IBOutlet weak var userImage_Image: UIImageView!
    @IBOutlet weak var userName_Lbl: UILabel!
    
    @IBOutlet weak var userAge_Lbl: UILabel!
    @IBOutlet weak var emailAddress_Lbl: UILabel!
    @IBAction func settings_Btn(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "settingsSegue", sender: self)
    }
    
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
    var ref = Database.database().reference().child("History")
    var userRef = Database.database().reference()
    let user = Auth.auth().currentUser
    var historyList = [DataSnapshot]()
    @IBOutlet weak var previousAppointmentsTV: UITableView!
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ref =  self.ref.child((user?.uid)!)
        if let user = self.user {
            // The user's ID, unique to the Firebase project.
            // Do NOT use this value to authenticate with your backend server,
            // if you have one. Use getTokenWithCompletion:completion: instead.
            //let uid = user.uid
            let displayName = user.displayName
            //let photoURL = user.photoURL?.absoluteString
            let email = user.email
            
            self.userName_Lbl.text = displayName
            self.emailAddress_Lbl.text = email
            //print(photoURL)
            //let url = URL(string: photoURL ?? "https://firebasestorage.googleapis.com/v0/b/doctor-6a5df.appspot.com/o/cavity.png?alt=media&token=37edfbdd-da45-42ec-9295-2cc67fb9af1f")
            //                if let data = try? Data(contentsOf: url!) {//make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            //                    self.userImage_Image.image = UIImage(data: data)
            //                    //userImage.do
            //
            //                    // ...
            //                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         TableArray = ["All","Cavities","Teeth health"]
        let userID = Auth.auth().currentUser?.uid
        userRef.child("Patients").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let userAge = value?["age"] as? String ?? ""
            //let user = User(username: username)
            self.age_Lbl.text = userAge
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        if Auth.auth().currentUser != nil {
            // User is signed in.
            // ...
            if let user = self.user {
                // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with your backend server,
                // if you have one. Use getTokenWithCompletion:completion: instead.
                //let uid = user.uid
                let displayName = user.displayName
                //let photoURL = user.photoURL?.absoluteString
                let email = user.email
                
                self.userName_Lbl.text = displayName
                self.emailAddress_Lbl.text = email
                
                //let url = URL(string: photoURL ?? "https://firebasestorage.googleapis.com/v0/b/doctor-6a5df.appspot.com/o/cavity.png?alt=media&token=37edfbdd-da45-42ec-9295-2cc67fb9af1f")
//                if let data = try? Data(contentsOf: url!) {//make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//                    self.userImage_Image.image = UIImage(data: data)
//                    //userImage.do
//                    
//                    // ...
//                }
            }
            
            
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
        //let UID = (user?.uid)!
        //ref = ref.child(UID)
        
        

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func logOutAction(sender: AnyObject) {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUp")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
