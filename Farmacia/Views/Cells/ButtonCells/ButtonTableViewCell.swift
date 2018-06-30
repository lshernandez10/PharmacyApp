//
//  ButtonTableViewCell.swift
//  Farmacia
//
//  Created by Sofía Hernández on 6/27/18.
//  Copyright © 2018 Sofía Hernández. All rights reserved.
//

import UIKit

protocol ButtonCellDataSource {
    var buttonText: String { get }
}

protocol ButtonCellDelegate {
    func buttonTapped(cell: ButtonTableViewCell)
}

class ButtonTableViewCell: BaseTableViewCell {

    @IBOutlet weak var button: UIButton!
    
    var delegate: ButtonCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
    }
    
    //MARK: - Actions
    
    /**
     Button tapped
     
     - parameter sender: UIBUtton
     */
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.buttonTapped(cell: self)
    }
    
    //MARK: - Public functions
    /**
     Configure a cell with its datasource and delegate
     
     - parameter dataSource: ButtonCellDataSource
     - parameter delegate: ButtonCellDelegate
    */
    func configureWith(dataSource: ButtonCellDataSource, andDelegate delegate: ButtonCellDelegate?) {
        configureCellWith(dataSource: dataSource)
        configureWith(delegate: delegate)
    }
    
    //MARK: - Private methods
    /**
     Configure a cell with its datasource
     
     - parameter dataSource: ButtonCellDataSource
     */
    private func configureCellWith(dataSource: ButtonCellDataSource) {
        button.setTitle(dataSource.buttonText, for: .normal)
    }
    
    /**
     Configure cell with its delegate
     
     - parameter delegate: ButtonCellDelegate
     */
    private func configureWith(delegate: ButtonCellDelegate?) {
        self.delegate = delegate
    }
}
