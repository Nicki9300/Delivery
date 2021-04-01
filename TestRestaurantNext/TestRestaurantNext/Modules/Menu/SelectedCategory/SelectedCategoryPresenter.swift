//
//  SelectedCategoryPresenter.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 25.03.2021.
//

import Foundation

protocol SelectedCategoryPresenterProtocol {
    init(view: SelectedCategoryViewControllerProtocol, selectedCategory: Category )
    func configurateTopBar()
    func getCountItem() -> Int
    func configurateSelectedCell (cell: SelectedCategoryTableViewCellProtocol, indexPath: IndexPath)
}

class SelectedCategoryPresenter: SelectedCategoryPresenterProtocol {
    
    private unowned let view: SelectedCategoryViewControllerProtocol
    
    required init(view: SelectedCategoryViewControllerProtocol, selectedCategory: Category ) {
        self.view = view
        self.selectedCategory = selectedCategory
    }
    
    //MARK: Properties
    private let selectedCategory: Category
    
    // MARK: - UI
    func configurateTopBar() {
        
        self.view.display(selectedCategory: SelectedCategoryViewController.SelectedCategoryModel(
                            name: selectedCategory.name,
                            image: selectedCategory.image))
    }

    func configurateSelectedCell (cell: SelectedCategoryTableViewCellProtocol, indexPath: IndexPath) {
        let countDish = DataManager.shared.getCountFromOrder(dish: selectedCategory.dishes[indexPath.row])
        cell.display(selectedCategoryModel:
                        SelectedCategoryTableViewCell.SelectedCategoryModel(image: selectedCategory.dishes[indexPath.row].image,
                                                                            name: selectedCategory.dishes[indexPath.row].name,
                                                                            price: selectedCategory.dishes[indexPath.row].price,
                                                                            countDish: countDish))
        
        cell.pressedPlusCountHandler = { [weak self, weak cell] () in
            guard let self = self else { return }

            DataManager.shared.addDishInOrder(self.selectedCategory.dishes[indexPath.row])
            self.view.display(totalCost: DataManager.shared.createOrder!.totalCost)
            cell?.display(countDish: DataManager.shared.getCountFromOrder(dish: self.selectedCategory.dishes[indexPath.row]))
        }
        
        cell.pressedMinusCountHandler = { [weak self] () in
            guard let self = self else {return}

           DataManager.shared.removeDishFromOrder(dish: self.selectedCategory.dishes[indexPath.row])
            self.view.display(totalCost: DataManager.shared.createOrder?.totalCost ?? 0)
            cell.display(countDish: DataManager.shared.getCountFromOrder(dish: self.selectedCategory.dishes[indexPath.row]))
        }
        
       
    }
    
    
    
    
    // MARK: - Actions
    func getCountItem() -> Int {
        
        return selectedCategory.dishes.count
    }
    
    
    
}
