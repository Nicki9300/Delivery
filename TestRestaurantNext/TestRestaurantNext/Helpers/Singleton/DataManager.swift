//
//  DataManager.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 25.03.2021.
//

import UIKit

struct Category {
    let name: String
    let image: String
    let id: Int
    let dishes: [Dish]
    
}

struct Dish: Equatable {
    let name: String
    let image: String
    let price: Int
    let  id: Int
    var count : Int
}

struct Order {
    
    let id: Int
    var totalCost: Int
    var status: Status
    var dishes: [Dish]
    
}

enum Status: String {
    
    case inProgress = "In progress"
    case done = "Done"
    case cancel = "Canceled"
    
    var backgroundColor: UIColor {
        switch self {
        case .inProgress:
            return UIColor.appColor(.orange)
        case .done:
            return UIColor.appColor(.green)
        case .cancel:
            return UIColor.appColor(.red)
        }
    }
}

extension Status: Equatable {
    
    static func > (lhs: Status, rhs: Status) -> Bool {
        switch (lhs, rhs) {
        case (.inProgress, .done) :
            return true
        case (.inProgress, .cancel) :
            return true
        case (.done, .cancel) :
            return true
        default:
            return false
        }
    }
}


class DataManager {
    
    // MARK: FROM API
    private var orders : [Order] = [Order(id: 10,
                                          totalCost: 64,
                                          status: .done,
                                          dishes: [Dish(name: "Sushi 1", image: "VegaRoll", price: 41, id: 101, count: 1),
                                                   Dish(name: "Sushi 2", image: "Filadelphia", price: 23, id: 102, count: 1)]),
                                    Order(id: 11,
                                          totalCost: 481,
                                          status: .done,
                                          dishes: [Dish(name: "Sushi 3", image: "VegaRoll", price: 41, id: 101, count: 1),
                                                   Dish(name: "Sushi 4", image: "Filadelphia", price: 23, id: 102, count: 1)]),
                                    Order(id: 12,
                                          totalCost: 183,
                                          status: .done,
                                          dishes: [Dish(name: "pizza 1", image: "Pizza", price: 40, id: 201, count: 3),
                                                   Dish(name: "Appetizers 1", image: "Appetizers", price: 63, id: 501, count: 1)]),
                                    Order(id: 13,
                                          totalCost: 134,
                                          status: .cancel,
                                          dishes: [Dish(name: "Salads 3", image: "Salads", price: 15, id: 303, count: 2),
                                                   Dish(name: "Deserts 3", image: "Deserts", price: 57, id: 403, count: 1),
                                                   Dish(name: "Salads 1", image: "Salads", price: 47, id: 301, count: 1 )])]
    
    
    private let category = [Category(name: "Appetizers",
                                     image: "Appetizers",
                                     id: 500,
                                     dishes: [Dish(name: "Appetizers 1", image: "Appetizers", price: 63, id: 501, count: 0),
                                              Dish(name: "Appetizers 2", image: "Appetizers", price: 21, id: 502, count: 0),
                                              Dish(name: "Appetizers 3", image: "Appetizers", price: 18, id: 503, count: 0),
                                              Dish(name: "Appetizers 4", image: "Appetizers", price: 17, id: 504, count: 0)]),
                            Category(name: "Salads",
                                     image: "Salads",
                                     id: 300,
                                     dishes: [Dish(name: "Salads 1", image: "Salads", price: 47, id: 301, count: 0),
                                              Dish(name: "Salads 2", image: "Salads", price: 26, id: 302, count: 0),
                                              Dish(name: "Salads 3", image: "Salads", price: 15, id: 303, count: 0),
                                              Dish(name: "Salads 4", image: "Salads", price: 16, id: 304, count: 0)]),
                            Category(name: "Sushi sets",
                                     image: "Syshi",
                                     id: 100,
                                     dishes: [Dish(name: "Sushi 1", image: "VegaRoll", price: 41, id: 101, count: 0),
                                              Dish(name: "Sushi 2", image: "Filadelphia", price: 23, id: 102, count: 0),
                                              Dish(name: "Sushi 3", image: "Kioto", price: 450, id: 103, count: 0),
                                              Dish(name: "Sushi 4", image: "FiladelphiaInK", price: 31, id: 104, count: 0)]),
                            Category(name: "Pizza",
                                     image: "Pizza",
                                     id: 200,
                                     dishes: [Dish(name: "Pizza 1", image: "Pizza", price: 40, id: 201, count: 0),
                                              Dish(name: "Pizza 2", image: "Pizza", price: 223, id: 202, count: 0),
                                              Dish(name: "Pizza 3", image: "Pizza", price: 15, id: 203, count: 0),
                                              Dish(name: "Pizza 4", image: "Pizza", price: 601, id: 204, count: 0)]),
                            Category(name: "Deserts",
                                     image: "Deserts",
                                     id: 400,
                                     dishes: [Dish(name: "Deserts 1", image: "Deserts", price: 81, id: 401, count: 0),
                                              Dish(name: "Deserts 2", image: "Deserts", price: 53, id: 402, count: 0),
                                              Dish(name: "Deserts 3", image: "Deserts", price: 57, id: 403, count: 0),
                                              Dish(name: "Deserts 4", image: "Deserts", price: 6, id: 404, count: 0)]),
    ]
    
    
    static let shared = DataManager()
    
    private init() {}
    
    //MARK: Properties
    private(set) var createOrder: Order?
    
    
    // UI
    func getAllCategory() -> [Category] {
        return category
    }
    
    func getDish (by index: Int) -> [Dish] {
        
        return category[index].dishes
    }
    
    
    // MARK: ORDERS
    func addDishInOrder (_ dish: Dish) {
        if createOrder == nil {
            createOrder = Order(id: 5, totalCost: 0, status: .inProgress, dishes: [Dish]())
        }
        
        if let IndexOfDish = createOrder?.dishes.firstIndex(where: {$0.id == dish.id }) {
            
            createOrder?.dishes[IndexOfDish].count += 1
            
        } else {
            createOrder?.dishes.append(Dish(name: dish.name, image: dish.image, price: dish.price, id: dish.id, count: dish.count + 1))
        }
        
        createOrder?.totalCost += dish.price
    }
    
    func removeDishFromOrder (dish: Dish)  {
        
        guard createOrder != nil  else { return }
        
        guard let indexOfDish = createOrder!.dishes.firstIndex(where: { $0.id == dish.id }) else { return  }
        
        createOrder?.dishes[indexOfDish].count -= 1
        
        if  createOrder?.dishes[indexOfDish].count == 0 {
            createOrder?.dishes.remove(at: indexOfDish)
        }
        
        createOrder?.totalCost -= dish.price
        
        if createOrder?.totalCost == 0 {
            createOrder = nil
        }
    }
    
    func getCountFromOrder(dish: Dish) -> Int {
        guard let orderDish = createOrder?.dishes.first(where: { $0.id == dish.id }) else { return 0 }
        
        return orderDish.count
    }
    
    func getAllOrders () -> [Order] {
        
        var newOrders = orders
        if let order = createOrder {
            newOrders.insert(order, at: 0)
            
        }
        
        return newOrders
    }
    
    func getCreatedOrder() -> Order? {
        return createOrder
        
    }    
    
}

