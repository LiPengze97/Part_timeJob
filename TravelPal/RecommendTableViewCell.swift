//
//  RecommendTableViewCell.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/10/12.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class RecommendTableViewCell: UITableViewCell {

    @IBOutlet weak var closePricetag: UILabel!
    @IBOutlet weak var closeSubtitle: UILabel!
    @IBOutlet weak var closeTitle: UILabel!
    @IBOutlet weak var closeImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
