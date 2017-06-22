//
//  ViewController.swift
//  Tweet
//
//  Created by Айдана Токбаева on 6/12/17.
//  Copyright © 2017 Aidana Tokbayeva. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UITextFieldDelegate {
    
  
    var gender = ""
    var interest = ""
    var somedateString = ""
    
   
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var occupation: UITextField!
    @IBOutlet weak var salaryIndicator: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBOutlet weak var Straight: UISwitch!

    
    
    func StraighChanged(_ sender: Any) {
        if Straight.isOn  {
            if SegmentControl.selectedSegmentIndex == 0 {
                interest = "women"
            }else{
                interest = "men"
            }
        }
        else {
            if SegmentControl.selectedSegmentIndex == 0 {
                interest = "men" }
            else{
                interest = "women"
            }
        }
    }
    
    @IBAction func BirthdayChanged(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        somedateString = dateFormatter.string(from: birthday.date)
    }

    @IBAction func valueChange(_ sender: Any) {
        let currentValue = Int(Slider.value)
        salaryIndicator.text = "\(currentValue) k"
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        switch SegmentControl.selectedSegmentIndex {
        case 0:
            gender = "male"
            case 1:
            gender = "female"
            default:
            break;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.delegate = self
        occupation.delegate = self
        
     
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func Tweet(_ sender: Any) {
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
            vc.setInitialText("My name is \(Name.text!). I work as a \(occupation.text!). My salary is \(Int(Slider.value)) k. I was born on \(somedateString). Interested in \(interest)   ")
            present(vc, animated: true)
        }
    }

}

