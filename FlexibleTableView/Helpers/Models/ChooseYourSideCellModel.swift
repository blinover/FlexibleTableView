//
//  ChooseYourSideCellModel.swift
//  FlexibleTableView
//
//  Created by Danil Blinov on 26.08.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

enum StarWarsSide: Int{
    case dark = 0
    case light = 1
}

struct ChooseYourSideCellModel: BaseCellModel {
    typealias SideButtonDidPressed = (_ side: StarWarsSide) -> Void
    
    var cellIdentifier: String = ChooseYourSideTableViewCell.cellIdentifier()
        var onClickSideButton:SideButtonDidPressed?
    
    init(onClickSideButton: @escaping SideButtonDidPressed) {
        self.onClickSideButton = onClickSideButton
    }
    
}
