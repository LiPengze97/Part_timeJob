//
//  TPTravelInfoCell.swift
//  TravelPal
//
//  Created by 李鹏泽 on 2017/5/14.
//  Copyright © 2017年 INGSwifters. All rights reserved.
//

import UIKit

class TPTravelInfoCell: UITableViewCell {
    @IBOutlet weak var deptTimeLabel: UILabel!

    @IBOutlet weak var transportationLabel: UILabel!
    @IBOutlet weak var planpeopleLabel: UILabel!
    @IBOutlet weak var destnationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
