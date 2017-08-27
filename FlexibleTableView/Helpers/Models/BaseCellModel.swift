//
//  BaseCellModel.swift
//  Pills Time
//
//  Created by Danil Blinov on 05.06.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

class BaseCellModel: NSObject {
    typealias ClickCellBlock = (_ cellModel: BaseCellModel) -> Void
    
    var onClickCellBlock:ClickCellBlock?
    var cellIdentifier:String = ""
}
