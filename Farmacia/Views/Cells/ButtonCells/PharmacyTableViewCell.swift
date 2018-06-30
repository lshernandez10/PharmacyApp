//
//  PharmacyTableViewCell.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/27/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

protocol PharmacyCellDataSource {
    var pharmacyDirection: String { get }
    var pharmacyImage: UIImage { get }
    var pharmacyName: String { get }
    var pharmacyShippingCost: Int { get }
}

protocol PharmacyCellDelegate {
    func cellTapped(cell: PharmacyTableViewCell)
}

class PharmacyTableViewCell: BaseTableViewCell {

    @IBOutlet weak var pharmacyDirection: UILabel!
    @IBOutlet weak var pharmacyImage: UIImageView!
    @IBOutlet weak var pharmacyName: UILabel!
    
    private var delegate: PharmacyCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configureCell()
    }
    
    //MARK: - Public functions
    /**
     Configure a cell with its datasource and delegate
     
     - parameter dataSource: PharmacyCellDataSource
     - parameter delegate: PharmacyCellDelegate
     */
    func configureWith(dataSource: PharmacyCellDataSource, andDelegate delegate: PharmacyCellDelegate?) {
        configureCellWith(dataSource: dataSource)
        configureWith(delegate: delegate)
    }
    
    //MARK: - Private methods
    
    /**
     Reset cell values
    */
    private func configureCell() {
        pharmacyDirection.text = nil
        pharmacyImage.image = nil
        pharmacyName.text = nil
    }
    
    /**
     Configure a cell with its datasource
     
     - parameter dataSource: ButtonCellDataSource
     */
    private func configureCellWith(dataSource: PharmacyCellDataSource) {
        pharmacyDirection.text = dataSource.pharmacyDirection
        pharmacyName.text = dataSource.pharmacyName
        pharmacyImage.image = dataSource.pharmacyImage
    }
    
    /**
     Configure cell with its delegate
     
     - parameter delegate: ButtonCellDelegate
     */
    private func configureWith(delegate: PharmacyCellDelegate?) {
        self.delegate = delegate
    }
}
