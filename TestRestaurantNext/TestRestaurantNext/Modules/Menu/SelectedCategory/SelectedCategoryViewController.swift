//
//  SelectedCategoryViewController.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 25.03.2021.
//

import UIKit

protocol SelectedCategoryViewControllerProtocol: BaseViewControllerProtocol {
    func display(selectedCategory: SelectedCategoryViewController.SelectedCategoryModel)
    func display(totalCost: Int)
}

class SelectedCategoryViewController: UIViewController {
        
    struct SelectedCategoryModel {
        let name: String
        let image: String
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var selectedCategoryLabel: UILabel!
    @IBOutlet weak var selectedCategoryImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalCostLabel: UILabel!
    
    // MARK: - Properties
    
    var presenter: SelectedCategoryPresenterProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        presenter.configurateTopBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalCostLabel.text = "\(DataManager.shared.createOrder?.totalCost ?? 0) $"
    }
    
    // MARK: - UI
    
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SelectedCategoryTableViewCell.self)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    // MARK: - IBActions
    
    @IBAction func pressedMakeOrder(_ sender: Any) {
        guard let createdOrder = DataManager.shared.getCreatedOrder() else { return }
        let vc = DetailOrderViewController.instance(.orders)
        vc.presenter = DetailOrderPresenter.init(view: vc, choisedOrder: createdOrder)
        self.pushToVC(vc, animated: true)
    }
}

extension SelectedCategoryViewController: UITableViewDelegate {
    
    
}

extension SelectedCategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getCountItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.create(SelectedCategoryTableViewCell.self, indexPath)
        presenter.configurateSelectedCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    
    
}

extension SelectedCategoryViewController: SelectedCategoryViewControllerProtocol {

    func display(selectedCategory: SelectedCategoryModel) {
        selectedCategoryImage.image = UIImage(named: selectedCategory.image)
        selectedCategoryLabel.text = selectedCategory.name
    }
    
    func display(totalCost: Int) {
        totalCostLabel.text = "\(totalCost) $"
    }
    
    
}
