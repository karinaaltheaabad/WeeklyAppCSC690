//
//  TableViewCell.swift
//  FinalCSC690
//
//  Created by Karina Abad on 5/19/20.
//  Copyright © 2020 Karina Abad. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var morninglistmember: UILabel!
    @IBOutlet weak var noonlistmember: UILabel!
    @IBOutlet weak var eveninglistmember: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
