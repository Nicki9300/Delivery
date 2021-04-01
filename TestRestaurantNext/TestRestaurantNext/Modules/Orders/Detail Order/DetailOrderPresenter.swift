//
//  DetailOrderPresenter.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 26.03.2021.
//

import Foundation

protocol DetailOrderPresenterProtocol {
    init(view: DetailOrderViewControllerProtocol, choisedOrder: Order)
    func configutateViewController()
}

class DetailOrderPresenter: DetailOrderPresenterProtocol {
    
    private unowned let view: DetailOrderViewControllerProtocol

    required init(view: DetailOrderViewControllerProtocol, choisedOrder: Order) {
        self.view = view
        self.choisedOrder = choisedOrder
    }
    
    private var choisedOrder: Order
    
    func configutateViewController() {
        let detailsOrder = choisedOrder.dishes.compactMap { (dish) -> String in
            return "\(dish.name): \(dish.count) шт \n"
        }
        let detailsOrder1 = detailsOrder.joined()
        
        self.view.display(detailOrder: DetailOrderViewController.DetailsOrder(status: choisedOrder.status,
                                                                              date: "01.02.03",
                                                                              orderNumber: String (choisedOrder.id),
                                                                              detailsOrder: detailsOrder1,
                                                                              totalCost: choisedOrder.totalCost))
        
    }
    
}
