//
//  TitleTableViewCelTableViewCell.swift
//  FlexibleTableView
//
//  Created by Danil Blinov on 26.08.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

class TitleTableViewCelTableViewCell: BaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func configureCell(cellModel: BaseCellModel) {
        if let model = cellModel as? TitleCellModel{
            self.titleLabel.text = model.titleString
            self.titleLabel.textAlignment = model.textAligment
            self.titleLabel.textColor = model.textColor
            self.titleLabel.font = model.titlefont
        }
    }
}
