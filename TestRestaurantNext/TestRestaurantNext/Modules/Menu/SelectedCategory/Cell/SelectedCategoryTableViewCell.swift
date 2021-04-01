//
//  SelectedCategoryTableViewCell.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 25.03.2021.
//

import UIKit

protocol SelectedCategoryTableViewCellProtocol: class  {
    var pressedPlusCountHandler: (() -> ())? { get set }
    var isPressedFavoriteHandler: (() -> ())? { get set }
    var pressedMinusCountHandler: (() -> ())? { get set }
    func display (selectedCategoryModel: SelectedCategoryTableViewCell.SelectedCategoryModel )
    func display(countDish : Int)
}

class SelectedCategoryTableViewCell: UITableViewCell {
    
    struct SelectedCategoryModel {
        let image: String
        let name: String
        let price: Int
        var countDish: Int
    }
    
     // MARK: - IBOutlets
    @IBOutlet weak var addToFavoriteButton: UIButton!
    @IBOutlet weak var imageDish: UIImageView!
    @IBOutlet weak var nameOfDish: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var minusCountButton: UIButton!
    @IBOutlet weak var plusCountButton: UIButton!
    
    //MARK: Properties
    var pressedPlusCountHandler: (() -> ())?
    var pressedMinusCountHandler: (() -> ())?
    var isPressedFavoriteHandler: (() -> ())?
    
     // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        resetContent()
        setupView()
    }
    
     // MARK: - UI
    override func prepareForReuse() {
        super.prepareForReuse()
        
        resetContent()
    }
     
    private func resetContent() {
       
    }
    
    private func setupView() {
        
    }
    
     // MARK: - IBActions
    @IBAction func pressedAddToFavorite(_ sender: UIButton) {
        isPressedFavoriteHandler?()
    }
    @IBAction func pressedMinusCountButton(_ sender: UIButton) {
        pressedMinusCountHandler?()
    }
    @IBAction func pressedPlusCountButton(_ sender: UIButton) {
        pressedPlusCountHandler?()
    }
}

extension SelectedCategoryTableViewCell: SelectedCategoryTableViewCellProtocol {
    
    func display (selectedCategoryModel: SelectedCategoryModel ) {
        
        imageDish.image = UIImage(named: selectedCategoryModel.image)
        nameOfDish.text = selectedCategoryModel.name
        priceLabel.text = "\(selectedCategoryModel.price) $"
        countLabel.text = "\(selectedCategoryModel.countDish)"
    }
    
    func display(countDish : Int) {
        countLabel.text = "\(countDish)"
    }
    
}
