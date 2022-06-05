//
//  TableViewCell.swift
//  StudentCoreData
//
//  Created by Aman Kumar on 16/05/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - IBOUTLETS
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
