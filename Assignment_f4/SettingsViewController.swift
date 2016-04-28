//
//  SettingsViewController.swift
//  Assignment_f4
//
//  Created by Bryan Okada on 4/24/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit

protocol DestinationDelegate {
    func setEmail(email: String);
    
}

class SettingsViewController: UIViewController {
    
    

    
    
    
    var delegate : DestinationDelegate! = nil
    var email : String! = nil
    
    
    

    @IBOutlet weak var lbl_current_email: UILabel!
    
    
    @IBOutlet weak var txt_email: UITextField!
    
 
    
    

   
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let email = NSUserDefaults.standardUserDefaults()
        lbl_current_email.text = email.stringForKey("new_email")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_submit(sender: UIButton) {
        
        lbl_current_email.text = txt_email.text
        
        
        
        let set_email = NSUserDefaults.standardUserDefaults()
       
            let new_e = lbl_current_email.text
            NSUserDefaults.standardUserDefaults().setObject(new_e, forKey: "new_email")
            NSUserDefaults.standardUserDefaults().synchronize()
          
            
            


        
        var notify = UIAlertController(title: "Saved", message: "Your email has been saved", preferredStyle: UIAlertControllerStyle.Alert)
        notify.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        self.presentViewController(notify, animated: true, completion: nil)
        
        
            
        
    
        
    }

   
  
    @IBAction func btn_done(sender: UIButton) {
        let email_ok = NSUserDefaults.standardUserDefaults()
        if let text = lbl_current_email.text where !text.isEmpty
        {
            email_ok.setBool(true, forKey: "completed_email")
            delegate.setEmail(text)
            self.dismissViewControllerAnimated(true, completion: nil)
        
            
            
        }
        else{
            email_ok.setBool(false, forKey: "completed_email")
            delegate.setEmail("No email inputted")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    
    @IBAction func txt_saved(sender: AnyObject) {
        
        if let text = txt_email.text where !text.isEmpty{
            lbl_current_email.text = txt_email.text
            //delegate.setEmail(lbl_current_email.text)
        }
        else {
            lbl_current_email.text = "No email inputted"
            
        }
        
        
        

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
