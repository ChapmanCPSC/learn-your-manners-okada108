//
//  MannerTableViewCell.swift
//  Assignment_f4
//
//  Created by Bryan Okada on 4/16/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit

class MannerTableViewCell: UITableViewCell {
    
  
    @IBOutlet weak var lbl_name: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        @IBOutlet weak var mannerPreview: UIView!
        // Initialization code
    }
    
    
   override func prepareForReuse() {
       self.mannerPreview.subviews.forEach { (v) -> () in
            v.removeFromSuperview()
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
         Configure the view for the selected state
    }
    
   /// func initwithManner(manner: Manners)
   // {
       // self.mannerName.text = manner.name
        
   // }
    
    
    
}

