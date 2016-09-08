//
//  DJSearchTableViewCell.swift
//  DJ_Lobo
//
//  Created by Star on 5/16/16.
//  Copyright © 2016 Star. All rights reserved.
//

import UIKit

class DJSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistImageView: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artistDetailLabel: UILabel!

    @IBOutlet weak var activityTitleLabel: UILabel!
    @IBOutlet weak var activityIconImageView: UIImageView!
    
    @IBOutlet weak var commentTime: UILabel!
    @IBOutlet weak var iconAvatarImageView: UIImageView!
    @IBOutlet weak var iconPlusSimbolImageView: UIImageView!
    @IBOutlet weak var iconSongPlayingImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
