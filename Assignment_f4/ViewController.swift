//
//  ViewController.swift
//  Assignment_f4
//
//  Created by Bryan Okada on 4/16/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
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
        
    
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cellNib = UINib(nibName: "MannerTableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "manner_cell")
    }
    
    
    

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manners.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
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
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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
    
        
        
    }
    
    
    


    
    



}

