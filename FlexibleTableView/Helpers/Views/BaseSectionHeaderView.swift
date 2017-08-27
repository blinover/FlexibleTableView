//
//  BaseSectionHeaderView.swift
//  Pills Time
//
//  Created by Danil Blinov on 07.07.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

class BaseSectionHeaderView: UITableViewHeaderFooterView {
    
    class func sectionIdentifier() -> String{
        return String(describing: self)
    }
    
    func configureSection(sectionModel: BaseSectionHeaderModel,section:Int){
        
    }
}
