//
//  BonuceViewController.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 24.03.2021.
//

import UIKit

protocol BonuceViewControllerProtocol: BaseViewControllerProtocol {

}

class BonuceViewController: UIViewController {
        
    // MARK: - IBOutlets
    
    @IBOutlet weak var buttonShare: UIButton!
    // MARK: - Properties
    
    var presenter: BonucePresenterProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = BonucePresenter(view: self)
        
        setupViews()
    }
    
    // MARK: - UI
    
    private func setupViews() {
        self.title = "Bonuce"
    }
    
    // MARK: - IBActions
    @IBAction func pressedShare(_ sender: UIButton) {
    }
    
}

extension BonuceViewController: BonuceViewControllerProtocol {

}
