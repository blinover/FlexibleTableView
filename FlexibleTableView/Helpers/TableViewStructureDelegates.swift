//
//  TableViewStructureDelegate.swift
//  Pills Time
//
//  Created by Danil Blinov on 05.07.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

let sectionHeaderHeight:CGFloat = 30.0

class TableViewStructureDelegates: NSObject{
    
    var sectionsArray: NSArray!
    var sectionsRowsArray: NSArray!
    var tableView: UITableView!
    
    init(tableView: UITableView) {
        super.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
        
        self.sectionsArray = [SimpleHeaderModel()]
        self.sectionsRowsArray = [[]]
    }
    
    func registerHeaderNib(_ tableView: UITableView, headerName:String){
        tableView.register(UINib(nibName: headerName, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: headerName)
    }
    
    func registerNib(_ tableView: UITableView, cellName:String){
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
    }


}

extension TableViewStructureDelegates:  UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let sectionRows = self.sectionsRowsArray[section] as! NSArray
        return sectionRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let sectionRows = self.sectionsRowsArray[indexPath.section] as! NSArray
        let anyModel = sectionRows[indexPath.row] as AnyObject // weird bridge to Obj-C as a _SwiftValue.
        if let model =  anyModel as? BaseCellModel{
            self.registerNib(self.tableView,cellName: model.cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as! BaseTableViewCell
            cell.configureCell(cellModel: model)
            return cell

        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return self.sectionsArray.count
    }
    
}


extension TableViewStructureDelegates:  UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        let anyModel = self.sectionsArray[section] as AnyObject // weird bridge to Obj-C as a _SwiftValue.
        if let sectionModel =  anyModel as? BaseSectionHeaderModel{
            return sectionModel.headerHeight
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        tableView.deselectRow(at: indexPath, animated: true)
//        let sectionRows = self.sectionsRowsArray[indexPath.section] as! NSArray
//        let baseCellModel = sectionRows[indexPath.row] as? BaseCellModel
//        if let closure = baseCellModel?.onClickCellBlock{
//            closure(baseCellModel!)
//        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?{
        let anyModel = self.sectionsArray[section] as AnyObject // weird bridge to Obj-C as a _SwiftValue.
        if let sectionModel =  anyModel as? BaseSectionHeaderModel{
            self.registerHeaderNib(self.tableView, headerName: sectionModel.identifier)
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionModel.identifier) as! BaseSectionHeaderView
            return header
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat{
        return 300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat{
        return sectionHeaderHeight
    }
    
}
