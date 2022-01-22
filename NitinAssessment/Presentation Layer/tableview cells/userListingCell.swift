//
//  userListingCell.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import UIKit

class userListingCell: UITableViewCell {
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(username: String?, image: String?) {
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        if let img = image {
            avatarImage.imageFromServerURL(urlString: img, PlaceHolderImage: UIImage())
        }
        lblUsername.text = username ?? ""
        lblName.text = username ?? ""
    }

}
