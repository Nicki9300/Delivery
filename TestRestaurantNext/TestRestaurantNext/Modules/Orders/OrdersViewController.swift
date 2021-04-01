//
//  OrdersViewController.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 26.03.2021.
//

import UIKit

protocol OrdersViewControllerProtocol: BaseViewControllerProtocol {
    func reloadTableView()
}

class OrdersViewController: UIViewController {
        
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    
    var presenter: OrdersPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getOrders()
        reloadTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter = OrdersPresenter(view: self)
        setupTableView()
        setupViews()
    }
    
    // MARK: - UI
    
    private func setupViews() {
        self.title = "Orders"
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(OrdersTableViewCell.self)
    }
    
    func reloadTableView() {
        tableView.reloadData()
        
    }
    
    // MARK: - IBActions
    
}

extension OrdersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.choisedCell(index: indexPath.row)
    }

}

extension OrdersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.create(OrdersTableViewCell.self, indexPath)
        presenter.configurateCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    
    
}

extension OrdersViewController: OrdersViewControllerProtocol {

}
