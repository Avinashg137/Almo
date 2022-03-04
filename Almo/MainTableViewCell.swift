//
//  MainTableViewCell.swift
//  Almo
//
//  Created by MAC OS on 03/03/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var IMG: UITableView!
    @IBOutlet weak var IMG1: UILabel!
    
    @IBOutlet weak var IMG2: UILabel!
    @IBOutlet weak var IMG3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
