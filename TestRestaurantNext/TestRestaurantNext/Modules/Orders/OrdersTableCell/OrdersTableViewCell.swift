//
//  OrdersTableViewCell.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 26.03.2021.
//

import UIKit

protocol OrdersTableViewCellProtocol {
    func display(status: Status, date: String, detailsOrder: String, totalCost: Int)
}

class OrdersTableViewCell: UITableViewCell {
   
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var detailsOrderLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        resetContent()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        resetContent()
    }
     
    private func resetContent() {
        
    }
    
    private func setupView() {
        
    }
    
}

extension OrdersTableViewCell: OrdersTableViewCellProtocol {
    
    func display(status: Status, date: String, detailsOrder: String, totalCost: Int) {
        dateLabel.text = date
        detailsOrderLabel.text = detailsOrder
        totalCostLabel.text = "Cost: \(totalCost) $"
        switch status {
        default:
            statusLabel.text = status.rawValue
            statusLabel.backgroundColor = status.backgroundColor
        }

        
    }
    
}
