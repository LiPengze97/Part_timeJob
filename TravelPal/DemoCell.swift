//
//  DemoCell.swift
//  FoldingCell
//

import UIKit

protocol RequestJumpDelegate {
    func requestJump(index: Int)
    
}

class DemoCell: FoldingCell {
    var delegate: RequestJumpDelegate?
    //选择的行数
    var selectnum = 0
    //所属的tableview
    var tableid = 0
  @IBOutlet weak var closeNumberLabel: UILabel!
  @IBOutlet weak var openNumberLabel: UILabel!
    @IBOutlet weak var requsetBtn: UIButton!
  
  var number: Int = 0 {
    didSet {
      closeNumberLabel.text = String(number)
      openNumberLabel.text = String(number)
    }
  }
  override func awakeFromNib() {
    
    foregroundView.layer.cornerRadius = 10
    foregroundView.layer.masksToBounds = true
    super.awakeFromNib()
  }
  

  override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
    
    let durations = [0.26, 0.2, 0.2]
    return durations[itemIndex]
  }
    
    @IBAction func requestTapped(_ sender: Any) {
        delegate?.requestJump(index: tableid)
        
    }

}

