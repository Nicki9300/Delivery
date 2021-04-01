//
//  MenuPresenter.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 25.03.2021.
//

import Foundation

protocol MenuPresenterProtocol {
    init(view: MenuViewControllerProtocol)
    func configurateCategoryMenu (cell: MenuTableViewCellProtocol, indexPath: IndexPath)
    func getCountItem() -> Int
    func didSelecteCategory(selectedIndex: Int)
}

class MenuPresenter: MenuPresenterProtocol {
    
    private unowned let view: MenuViewControllerProtocol

    required init(view: MenuViewControllerProtocol) {
        self.view = view
    }
    
    //MARK: Properties
    private let category = DataManager.shared.getAllCategory()
    
    func configurateCategoryMenu (cell: MenuTableViewCellProtocol, indexPath: IndexPath) {
        cell.display(model: MenuTableViewCell.menuCell.init(name: category[indexPath.row].name,
                                                            image: category[indexPath.row].image))
    }
    
    func getCountItem() -> Int {

      return category.count
    }
    
    func didSelecteCategory(selectedIndex: Int) {
        
        let vc = SelectedCategoryViewController.instance(.menu)
        vc.presenter = SelectedCategoryPresenter(view: vc, selectedCategory: category[selectedIndex])
        self.view.pushToVC(vc, animated: true)
     
        
    }
    
    
    
}
