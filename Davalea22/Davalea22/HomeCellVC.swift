//
//  HomeCellVC.swift
//  Davalea22
//
//  Created by Kote Ghudushauri on 5/16/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit

class HomeCellVC: UITableViewCell {
    
    @IBOutlet weak var profilepichomecell: UIImageView!
    
    @IBOutlet weak var postnamehomecell: UILabel!
    
    @IBOutlet weak var postlastnamehomecell: UILabel!
    
    @IBOutlet weak var postcontexthomecell: UILabel!
    
    @IBOutlet weak var postdatehomecell: UILabel!
    
    var post: Post! {
        didSet {
            let poster = post.user
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            let myString = formatter.string(from: Date())
            post.date = formatter.date(from: myString)
            formatter.dateFormat = "MM-dd-yyyy"
            let myStringafd = formatter.string(from: post.date!)
            
            postcontexthomecell.text = post.content
            postdatehomecell.text = myStringafd
            postnamehomecell.text = poster?.firstname
            if let image = poster?.profilepicture {
                profilepichomecell.image = UIImage(data: (poster?.profilepicture)!)
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
