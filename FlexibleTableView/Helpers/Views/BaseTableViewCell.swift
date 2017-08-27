//
//  BaseTableViewCell.swift
//  Pills Time
//
//  Created by Danil Blinov on 03.06.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    class func cellIdentifier() -> String{
        return String(describing: self)
    }
    
    func configureCell(cellModel: BaseCellModel){
        
    }

}
