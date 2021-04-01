//
//  MenuTableViewCell.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 25.03.2021.
//

import UIKit

protocol MenuTableViewCellProtocol {
    func display(model: MenuTableViewCell.menuCell)
}

class MenuTableViewCell: UITableViewCell {
    
    struct menuCell {
        let name : String
        let image: String
    }
    
     // MARK: - IBOutlets
    @IBOutlet weak var imageViewCategory: UIImageView!
    @IBOutlet weak var nameCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        resetContent()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        resetContent()
    }
     
     // MARK: - UI
    private func resetContent() {
       
    }
    
    private func setupView() {
        
    }
    
}

extension MenuTableViewCell: MenuTableViewCellProtocol {
 
    func display(model: MenuTableViewCell.menuCell) {
        
        nameCategoryLabel.text = model.name
        imageViewCategory.image = UIImage(named: model.image)
        
    }
    
}
