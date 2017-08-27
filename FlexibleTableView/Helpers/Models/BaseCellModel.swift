//
//  BaseCellModel.swift
//  Pills Time
//
//  Created by Danil Blinov on 05.06.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

typealias ClickCellBlock = (_ cellModel: BaseCellModel) -> Void

protocol BaseCellModel{
    var cellIdentifier:String { get set }
}
