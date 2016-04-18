//
//  MannersDetailViewController.swift
//  Assignment_f4
//
//  Created by Bryan Okada on 4/16/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit

class MannersDetailViewController: UIViewController {

    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var image_manner: UIImageView!
    
    @IBOutlet weak var lbl_description: UILabel!
    
    
    
    var manner : Manners!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbl_title.text = manner.name
        self.image_manner.image = manner.picture
        self.lbl_description.text = manner.description


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_back(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
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
