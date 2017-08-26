//
//  TableViewStructureDelegate.swift
//  Pills Time
//
//  Created by Danil Blinov on 05.07.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

let sectionHeaderHeight:CGFloat = 30.0

class TableViewStructureDelegates: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var sectionsArray: NSArray = NSArray()
    var sectionsRowsArray: NSArray = NSArray()
    var tableView: UITableView = UITableView()
    var delegatingViewController = UIViewController()
    
    func setupTableView(tableView: UITableView)
    {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        let sectionModel =  self.sectionsArray[section] as! BaseSectionHeaderModel
        return sectionModel.headerHeight
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let sectionRows = self.sectionsRowsArray[indexPath.section] as! NSArray
        let baseCellModel = sectionRows[indexPath.row] as? BaseCellModel
        if let closure = baseCellModel?.onClickCellBlock{
                closure(baseCellModel!)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let sectionModel =  self.sectionsArray[section] as! BaseSectionHeaderModel
        self.registerHeaderNib(self.tableView, headerName: sectionModel.identifier)
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: sectionModel.identifier) as! BaseSectionHeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 300
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat
    {
        return sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let sectionRows = self.sectionsRowsArray[section] as! NSArray
        return sectionRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let sectionRows = self.sectionsRowsArray[indexPath.section] as! NSArray
        let cellModel =  sectionRows[indexPath.row] as! BaseCellModel
        
        self.registerNib(self.tableView,cellName: cellModel.cellIdentifier)

        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier, for: indexPath) as! BaseTableViewCell
        cell.configureCell(cellModel: cellModel)

        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return self.sectionsArray.count
    }
    
    func registerHeaderNib(_ tableView: UITableView, headerName:String)
    {
        tableView.register(UINib(nibName: headerName, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: headerName)
    }
    
    func registerNib(_ tableView: UITableView, cellName:String)
    {
        tableView.register(UINib(nibName: cellName, bundle: Bundle.main), forCellReuseIdentifier: cellName)
    }


}
