//
//  ViewController.swift
//  Dr. Abdelrhman Arwish Clinic
//
//  Created by Abdelrhman on 6/13/19.
//  Copyright © 2019 Dr. Abdelrhman Arwish Clinic. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SDWebImage
var finalDiagnosis = ""
var finalActions = ""
var finalNotes = ""
var finalMedications = ""
var finalAppointmentDate = ""
var finalDate = ""
var finalVisitType = ""
var visitDate = ""
class UserProfileVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let user = Auth.auth().currentUser
    var ref = Database.database().reference().child("Patients")
    var historyRef = Database.database().reference().child("History")
    var profileList = [DataSnapshot]()
    
    
    
    
    
    
    
    @IBOutlet weak var profileTV: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return profileList.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let model = profileList[indexPath.row]
        //print(wallList[postIndex])
        let model = profileList[indexPath.row]
        if let value = model.value as? [String:Any]{
            
            if let text = value["name"] as? String{
                print(text)
                performSegue(withIdentifier: "profileSegue", sender: self)
                
            }else{
                if let text = value["visitDate"] as? String{
                    visitDate = text
                    
                    
                }
                
                performSegue(withIdentifier: "visitSegue", sender: self)
            }
            
        }
        
        //performSegue(withIdentifier: "postIDetailsVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCell
        
        let model = profileList[indexPath.row]
        if let value = model.value as? [String:Any]{
            
            if let text = value["name"] as? String{
                cell.profileTitle_LBL!.text = text
                
                
            }
            
            if let text = value["detail"] as? String{
                cell.profileDetail_LBL!.text = text
                
                
            }
            
            if let postPicture = value["profilePic"] as? String{
                
                let imageUrl:NSURL? = NSURL(string: postPicture)
                if let url = imageUrl {
                    cell.profile_Pic.sd_setImage(with: url as URL)
                    
                    
                }
                
                
            }
            
            if let text = value["visitNum"] as? String{
                cell.profileTitle_LBL!.text = text
                
                
            }
            if let text = value["visitDate"] as? String{
                cell.profileDetail_LBL!.text = text
                
                
            }
            if let postPicture = value["historyPic"] as? String{
                
                let imageUrl:NSURL? = NSURL(string: postPicture)
                if let url = imageUrl {
                    cell.profile_Pic.sd_setImage(with: url as URL)
                    
                    
                }
                
                
            }
           
            
        }
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = self.user {
            print("the user",user.uid)
           
            ref.child(user.uid).observeSingleEvent(of: .value, with: { snapshot in
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    self.profileList.append(snap)
                    
                    
                    
                    
                    
                }
                
                self.profileTV.reloadData()
            })
 
            historyRef.child(user.uid).observeSingleEvent(of: .value, with: { snapshot in
                for child in snapshot.children {
                    let snap = child as! DataSnapshot
                    self.profileList.append(snap)
                    
                    print(snapshot)
                    
                }
                
                self.profileTV.reloadData()
            })
            
        }
        
       
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
