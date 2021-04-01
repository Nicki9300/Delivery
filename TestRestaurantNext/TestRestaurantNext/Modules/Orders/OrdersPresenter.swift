//
//  OrdersPresenter.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 26.03.2021.
//

import Foundation

protocol OrdersPresenterProtocol {
    init(view: OrdersViewControllerProtocol)
    func configurateCell (cell: OrdersTableViewCellProtocol, indexPath: IndexPath)
    func getCountItem() -> Int
    func choisedCell(index: Int)
    func getOrders()
}

class OrdersPresenter: OrdersPresenterProtocol {
   
    private unowned let view: OrdersViewControllerProtocol

    required init(view: OrdersViewControllerProtocol) {
        self.view = view
    }
    
     //MARK: Properties
    private var orders : [Order] = []
    
   
    
     // MARK: - Actions
    func getCountItem() -> Int {
        return orders.count
    }
    
    func getOrders() {
        orders = DataManager.shared.getAllOrders()
    }
    
    func configurateCell (cell: OrdersTableViewCellProtocol, indexPath: IndexPath) {
        let order = orders[indexPath.row]
        
        let detailsOrder = order.dishes.compactMap { (dish) -> String in
            return "\n \(dish.name): \(dish.count) шт "
        }
       
        let detailsOrder1 = detailsOrder.joined()
        cell.display(status: order.status , date: "26.03.2021", detailsOrder: detailsOrder1, totalCost: order.totalCost)
    }
    
    func choisedCell(index: Int) {
        let vc = DetailOrderViewController.instance(.orders)
        vc.presenter = DetailOrderPresenter.init(view: vc, choisedOrder: orders[index])
        self.view.pushToVC(vc, animated: true)
        
    }
    
}
