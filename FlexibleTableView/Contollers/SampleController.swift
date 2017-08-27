//
//  FirstAidViewController.swift
//  Pills Time
//
//  Created by Danil Blinov on 11.06.17.
//  Copyright © 2017 Mobile Creatures. All rights reserved.
//

import UIKit

private let halventicaBold = "Helvetica-Bold"
private let chooseYourSideFontSize: CGFloat = 20.0

class SampleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableViewStructureDelegates: TableViewStructureDelegates!
    
    override func viewDidLoad() {
        self.setupViewController()
    }

    
    func setupViewController()
    {
        self.tableViewStructureDelegates = TableViewStructureDelegates(tableView: self.tableView)

        
        let sectionsArray: NSArray = [BaseSectionHeaderModel()]
        
        self.tableViewStructureDelegates.sectionsArray = sectionsArray
        
        self.createStructure()
    }
    
    func createStructure(performReload: Bool? = true)
    {
        var rowsArray: [BaseCellModel] = []
        
        let starWarsLogoCellModel = StarWarsLogoCellModel()
        rowsArray.append(starWarsLogoCellModel)
        
        let titleCellModel = TitleCellModel(title: "CHOOSE YOUR SIDE", textColor: .white, aligment: .center, font: UIFont(name: halventicaBold, size: chooseYourSideFontSize))
        rowsArray.append(titleCellModel)
        
        let sideButtonsCellModel = ChooseYourSideCellModel()
        sideButtonsCellModel.onClickSideButton = {(side: StarWarsSide) -> Void in
            switch side {
            case .dark:
                self.showAler(title: "Dark Side", subTille: "You will be greeted by a Darth Vader", confirm: {
                    
                })
            case .light:
                self.showAler(title: "Light Side", subTille: "You will be greeted by a Yoda", confirm: {
                    
                })
            }
        }
        rowsArray.append(sideButtonsCellModel)
        
        self.tableViewStructureDelegates.sectionsRowsArray = [rowsArray]
        
        if performReload == true{
            self.tableView.reloadData()
        }
    }
    
    func showAler(title: String, subTille: String, confirm: @escaping () -> Void)
    {
        let alertController = UIAlertController(title: title, message: subTille, preferredStyle: .alert)
        let alertActionConfirm = UIAlertAction(title: "Ок", style: .default) { (action) in
            confirm()
        }
        alertController.addAction(alertActionConfirm)
        self.present(alertController, animated: true, completion: nil)
    }

}
