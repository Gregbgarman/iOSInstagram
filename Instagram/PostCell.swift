//
//  PostCell.swift
//  Instagram
//
//  Created by Greg Garman on 10/2/21.
//

import UIKit

class PostCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBOutlet weak var IVphotoview: UIImageView!
    
    @IBOutlet weak var LabelUsername: UILabel!
    
    @IBOutlet weak var LabelComment: UILabel!
    
    
    
    
}
