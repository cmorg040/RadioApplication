//
//  ShowTableViewCell.swift
//  RadioApp
//
//  Created by Carrel on 4/16/20.
//  Copyright © 2020 Carrel. All rights reserved.
//

import UIKit

class ShowTableViewCell: UITableViewCell {

    //Show title
    @IBOutlet weak var titleLabel: UILabel!
    //Show Dates/Times
    @IBOutlet weak var dateLabel: UILabel!
    //Show Description
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
