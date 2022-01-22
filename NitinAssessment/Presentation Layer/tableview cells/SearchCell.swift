//
//  SearchCell.swift
//  iOS Developer Assessment - Nitin Agnohotri
//
//  Created by yudhvir singh on 15/01/22.
//

import UIKit

class SearchCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
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
    
    func configure(username: String?, name: String?, imageUrl: String?) {
        containerView.layer.cornerRadius = UIConstants.UIScalables.cornerRadius
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        
//        avatarImage.image = image ?? UIImage(named: "userIconPlaceholder")
        if let imgUrl = imageUrl {
            avatarImage.imageFromServerURL(urlString: imgUrl, PlaceHolderImage: UIImage())
        }
        lblUsername.text = username ?? AppConstants.Placeholders.username
        lblName.text = name ?? AppConstants.Placeholders.name
    }

}
