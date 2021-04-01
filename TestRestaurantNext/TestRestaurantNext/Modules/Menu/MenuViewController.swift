//
//  MenuViewController.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 25.03.2021.
//

import UIKit

protocol MenuViewControllerProtocol: BaseViewControllerProtocol {
  
}

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    
    var presenter: MenuPresenterProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        presenter = MenuPresenter(view: self)
        setupViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalCostLabel.text = "\(DataManager.shared.createOrder?.totalCost ?? 0) $"
    }
    
    // MARK: - UI
    private func setupViews() {
        setupTableView()
        self.title = "Menu"
    }
    
    private func setupTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuTableViewCell.self)
        
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: - IBActions
    
    @IBAction func pressedMakeOrder(_ sender: UIButton) {
        guard let createdOrder = DataManager.shared.getCreatedOrder() else { return }
        let vc = DetailOrderViewController.instance(.orders)
        vc.presenter = DetailOrderPresenter.init(view: vc, choisedOrder: createdOrder)
        self.pushToVC(vc, animated: true)
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelecteCategory(selectedIndex: indexPath.row)
    }
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.create(MenuTableViewCell.self, indexPath)
        presenter.configurateCategoryMenu(cell: cell, indexPath: indexPath)
        return cell
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    
 
      
   
    
}
