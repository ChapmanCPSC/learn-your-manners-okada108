//
//  Talking in the Library.swift
//  Assignment_f4
//
//  Created by Bryan Okada on 4/18/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit

class Talking_in_the_Library : Manners {
    
    var name : String
    var description : String
    var picture : UIImage
    
    init (name : String, description: String, picture: UIImage)
    {
        self.name = name
        self.description = description
        self.picture = picture
    }
}
