//
//  ViewController.swift
//  Assignment_f4
//
//  Created by Bryan Okada on 4/16/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DestinationDelegate, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var mannerTableView: UITableView!
    
    
    @IBOutlet var lbl_email: UILabel!

    
    @IBOutlet var bottom_toolbar: UIToolbar!

    
    
     var checked = [Bool](count: 8, repeatedValue: false)
    
    var manners : [Manners] = [
        Sneezing(name: "Sneezing", description: "It is polite to sneeze into your elbow and not at people without covering your mouth.", picture: UIImage(named: "sneezing")!),
        Shoes(name: "Shoes", description: "It is polite to take your shoes off in some people's house unless they say that they do not mind it.", picture: UIImage(named: "shoes")!),
        Chewing(name: "Chewing", description: "It is polite to chew with your mouth closed and not make too much noise when chewing.", picture: UIImage(named: "chewing")!),
        Knocking(name: "Knocking", description: "It is polite to knock on someone's door before walking in- especially if you are not too familiar with them.", picture: UIImage(named: "knocking")!),
        Doors(name: "Holding the Door", description: "It is polite to hold the door open to people walking in behind you rather than slamming it in their face.", picture: UIImage(named: "holding_door")!),
        Cursing(name: "Language", description: "It is polite to refrain from using curse words as many people think it is offensive.", picture: UIImage(named: "curse_words")!),
        Coughing(name: "Coughing", description: "It is polite to cough into one's elbow and not at other people as this can spread germs.", picture: UIImage(named: "coughing")!),
        Talking(name: "Talking in the Library", description: "It is polite to keep your voice at a whisper level when talking in the library.", picture: UIImage(named: "talking")!)]
    
    
        
    var checked_to_send : [String] = []
    

    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bottom_toolbar.hidden = true
        
        self.mannerTableView.dataSource = self
        self.mannerTableView.delegate = self
        let cellNib = UINib(nibName: "MannerTableViewCell", bundle: nil)
        self.mannerTableView.registerNib(cellNib, forCellReuseIdentifier: "manner_cell")
        let saved_email = NSUserDefaults.standardUserDefaults()
        lbl_email.text = saved_email.stringForKey("new_email")
    }
    
 
    
    //check to see email is empty or not -> Load the email button
    override func viewDidAppear(animated: Bool) {
        let new_e = NSUserDefaults.standardUserDefaults()
        let entered_email = new_e.boolForKey("completed_email")
    
        if !entered_email{
            lbl_email.text = "No email inputted"
            bottom_toolbar.hidden = true
            
        }
        else {
            bottom_toolbar.hidden = false
        }
       
    }
    
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manners.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let manner = self.manners[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("manner_cell") as! MannerTableViewCell
        
        cell.initwithManner(manner)
        
        if (!checked[indexPath.row])
        {
            cell.accessoryType = .None
        }
        
        else if (checked[indexPath.row])
        {
            cell.accessoryType = .Checkmark
            
        
        
        }
        
            return cell
        
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let navVC = self.storyboard!.instantiateViewControllerWithIdentifier("detail_view") as! UINavigationController
        
        let detailVC = navVC.viewControllers[0] as! MannersDetailViewController
        detailVC.manner = self.manners[indexPath.row]
        
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath){
            if cell.accessoryType == .Checkmark{
                cell.accessoryType = .None
                checked[indexPath.row] = false
            }
            else{
                cell.accessoryType = .Checkmark
                checked[indexPath.row] = true
            }
        }
        self.presentViewController(navVC, animated: true, completion: nil)
        self.checked_to_send.append(self.manners[indexPath.row].name)
    
        
        
    }
    
    
    @IBAction func btn_settings(sender: AnyObject) {
        
        
        
        let navVC2 = self.storyboard!.instantiateViewControllerWithIdentifier("settings_vc") as! UINavigationController
        
        let settingVC = navVC2.viewControllers[0] as! SettingsViewController
        settingVC.delegate = self
        
        self.presentViewController(navVC2, animated: true, completion: nil)
        
        
    }
    
    
    func setEmail(email: String)
    {
        
        lbl_email.text = email
    }
    
    
    func makeMailComposer() -> MFMailComposeViewController {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        let manners_learned = self.checked_to_send.joinWithSeparator(" , ")
        
        mailVC.setToRecipients([lbl_email.text!])
        mailVC.setSubject("I learned my Manners!")
        mailVC.setMessageBody("Hi! Today I learned all of these manners: \n" + manners_learned , isHTML: false)
        
        return mailVC
    }
    
    func mailError() {
        let mailErrorView = UIAlertView(title: "Error", message: "Device could not send email", delegate: self, cancelButtonTitle: "Go Back")
        
        mailErrorView.show()
    }
    
   
 
//    
//    @IBAction func btn_email(sender: AnyObject) {
//        
//        let mail_sending = makeMailComposer()
//        
//        if MFMailComposeViewController.canSendMail() {
//            self.presentViewController(mail_sending, animated: true, completion: nil)
//        }
//        else {
//            self.mailError()
//        }
//    }

    
    
    @IBAction func btn_emailll(sender: AnyObject) {
        let mail_sending = makeMailComposer()
        
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mail_sending, animated: true, completion: nil)
        }
        else {
            self.mailError()
        }
        
    }
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        

        if result == MFMailComposeResultCancelled {
            
            print("Mail Canceled")
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
        
    
            
        }
    }
    


    
    


