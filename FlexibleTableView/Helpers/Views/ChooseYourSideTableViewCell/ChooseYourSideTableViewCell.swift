//
//  ChooseYourSideTableViewCell.swift
//  FlexibleTableView
//
//  Created by Danil Blinov on 26.08.17.
//  Copyright © 2017 Danil Blinov. All rights reserved.
//

import UIKit

private let darkSideColor = UIColor(colorLiteralRed: 145.0/255.0, green: 51.0/255.0, blue: 55.0/255.0, alpha: 1.0)

private let lightSideColor = UIColor(colorLiteralRed: 30.0/255.0, green: 117.0/255.0, blue: 119.0/255.0, alpha: 1.0)

class ChooseYourSideTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var lightButton: UIButton!
    private var cellModel: ChooseYourSideCellModel?
    
    override func configureCell(cellModel: BaseCellModel) {
        if let model = cellModel as? ChooseYourSideCellModel{
            self.cellModel = model
        }
        self.darkButton.layer.borderWidth = 2
        self.darkButton.layer.borderColor = darkSideColor.cgColor
        
        self.lightButton.layer.borderWidth = 2
        self.lightButton.layer.borderColor = lightSideColor.cgColor
    }
    
    @IBAction func sideButtonDidPressed(_ sender: UIButton) {
        if let closure = self.cellModel?.onClickSideButton{
            closure(StarWarsSide(rawValue: sender.tag)!)
        }
    }
}
