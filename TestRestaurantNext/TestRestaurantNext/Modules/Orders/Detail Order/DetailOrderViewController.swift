//
//  DetailOrderViewController.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 26.03.2021.
//

import UIKit

protocol DetailOrderViewControllerProtocol: BaseViewControllerProtocol {
    func display(detailOrder: DetailOrderViewController.DetailsOrder)
}

class DetailOrderViewController: UIViewController {
        
    struct DetailsOrder {
        
        let status: Status
        let date: String
        let orderNumber: String
        let detailsOrder: String
        let totalCost: Int
    }
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateOrderLabel: UILabel!
    @IBOutlet weak var orderNumberLabel: UILabel!
    @IBOutlet weak var detailsOrderLabel: UILabel!
    @IBOutlet weak var totalCostOfOrderLabel: UILabel!
    // MARK: - Properties
    
    var presenter: DetailOrderPresenterProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.configutateViewController()
    }
    
    // MARK: - UI
    
    private func setupViews() {
        
    }
    
    // MARK: - IBActions
    
}

extension DetailOrderViewController: DetailOrderViewControllerProtocol {

    func display(detailOrder: DetailsOrder) {
       
        detailsOrderLabel.text = detailOrder.detailsOrder
        orderNumberLabel.text = detailOrder.orderNumber
        detailsOrderLabel.text = detailOrder.detailsOrder
        totalCostOfOrderLabel.text = "\(detailOrder.totalCost) $"
        dateOrderLabel.text = detailOrder.date
        
        switch  detailOrder.status {
        default:
            statusLabel.text = detailOrder.status.rawValue
            statusLabel.backgroundColor = detailOrder.status.backgroundColor
        }
        
    }
    
    
}
