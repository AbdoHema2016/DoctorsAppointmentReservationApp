//
//  OneAppointmentVC.swift
//  Doc
//
//  Created by Abdelrhman on 12/5/17.
//  Copyright © 2017 bigNerdeo. All rights reserved.
//

import UIKit

class IndividualAppointmentVC : UIViewController{
    
    
    //@IBOutlet weak var appointmentDate_Lbl: UILabel!
    @IBAction func Back_Btn(_ sender: UIButton) {
        /*
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TBC") as! UITabBarController
        self.present(newViewController, animated: true, completion: nil)
 */
    }
    @IBOutlet weak var visitType_Lbl: UILabel!
    @IBOutlet weak var date_Lbl: UILabel!
    @IBOutlet weak var doctorNotes_Lbl: UILabel!
    @IBOutlet weak var actions_Lbl: UILabel!
    @IBOutlet weak var diagnosis_Lbl: UILabel!
    @IBOutlet weak var mediactions_Lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //appointmentDate_Lbl.text = finalAppointmentDate
        doctorNotes_Lbl.text = finalNotes
        actions_Lbl.text = finalActions
        mediactions_Lbl.text = finalMedications
        diagnosis_Lbl.text = finalDiagnosis
        visitType_Lbl.text = finalVisitType
        date_Lbl.text = finalDate
    }
}
