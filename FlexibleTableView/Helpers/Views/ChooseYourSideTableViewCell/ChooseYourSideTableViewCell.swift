//
//  ChooseYourSideTableViewCell.swift
//  FlexibleTableView
//
//  Created by Danil Blinov on 26.08.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

class ChooseYourSideTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var darkButton: UIButton!
    @IBOutlet weak var lightButton: UIButton!
    private var cellModel: ChooseYourSideCellModel?
    
    override func configureCell(cellModel: BaseCellModel) {
        self.selectionStyle = .none
        if let model = cellModel as? ChooseYourSideCellModel{
            self.cellModel = model
        }
        self.darkButton.layer.borderWidth = 2
        self.darkButton.layer.borderColor = UIColor.MainScreen.darkSideButton.cgColor
        
        self.lightButton.layer.borderWidth = 2
        self.lightButton.layer.borderColor = UIColor.MainScreen.lightSideButton.cgColor
    }
    
    @IBAction func sideButtonDidPressed(_ sender: UIButton) {
        if let closure = self.cellModel?.onClickSideButton{
            closure(StarWarsSide(rawValue: sender.tag)!)
        }
    }
}

extension UIColor{
    
    struct MainScreen {
        
        static var darkSideButton: UIColor{
            return  UIColor(colorLiteralRed: 145.0/255.0, green: 51.0/255.0, blue: 55.0/255.0, alpha: 1.0)
        }
        
        static var lightSideButton: UIColor{
            return UIColor(colorLiteralRed: 30.0/255.0, green: 117.0/255.0, blue: 119.0/255.0, alpha: 1.0)

        }
    }
    
}
