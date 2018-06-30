//
//  BaseTableViewCell.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/27/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //MARK: - Public methods
    
    /**
     Returns cell identifier
    */
    class func cellIdentifier() -> String {
        return String(describing: self)
    }

}
