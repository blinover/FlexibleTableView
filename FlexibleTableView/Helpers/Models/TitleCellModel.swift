//
//  TitleCellModel.swift
//  FlexibleTableView
//
//  Created by Danil Blinov on 26.08.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

private let halventicaRegular = "Helvetica-Regular"
private let baseFontSize: CGFloat = 15.0

class TitleCellModel: BaseCellModel {
    var titleString:String?
    var textColor: UIColor!
    var textAligment: NSTextAlignment!
    var titlefont: UIFont!
    
    init(title: String, textColor: UIColor? = .black, aligment: NSTextAlignment? = .left, font: UIFont? = UIFont(name: halventicaRegular, size: baseFontSize)) {
        super.init()
        self.cellIdentifier = TitleTableViewCelTableViewCell.cellIdentifier()
        
        self.titleString = title
        self.textColor = textColor
        self.textAligment = aligment
        self.titlefont = font
    }
}
