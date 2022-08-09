//
//  FestivalCell.swift
//  Festival
//
//  Created by 해피스마일 on 2022/08/08.
//

import UIKit

class FestivalCell: UITableViewCell {

    @IBOutlet weak var festivalImageView: UIImageView!
    @IBOutlet weak var festivalTitleLabel: UILabel!    
    @IBOutlet weak var festivalPeriodLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
