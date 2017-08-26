//
//  ChooseYourSideCellModel.swift
//  FlexibleTableView
//
//  Created by Danil Blinov on 26.08.17.
//  Copyright © 2017 Danil Blinov. All rights reserved.
//

import UIKit

enum StarWarsSide: Int{
    case dark = 0
    case light = 1
}

class ChooseYourSideCellModel: BaseCellModel {
    typealias SideButtonDidPressed = (_ side: StarWarsSide) -> Void
    
    var onClickSideButton:SideButtonDidPressed?
    override init() {
        super.init()
        self.cellIdentifier = ChooseYourSideTableViewCell.cellIdentifier()
    }
}
