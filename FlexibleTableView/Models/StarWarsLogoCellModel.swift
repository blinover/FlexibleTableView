//
//  StarWarsLogoCellModel.swift
//  FlexibleTableView
//
//  Created by Danil Blinov on 26.08.17.
//  Copyright © 2017 Danil Blinov. All rights reserved.
//

import UIKit

class StarWarsLogoCellModel: BaseCellModel {
    
    override init() {
        super.init()
        self.cellIdentifier = StarWarsLogoTableViewCell.cellIdentifier()
    }
}
