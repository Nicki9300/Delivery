//
//  BonucePresenter.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 24.03.2021.
//

import Foundation

protocol BonucePresenterProtocol {
    init(view: BonuceViewControllerProtocol)
}

class BonucePresenter: BonucePresenterProtocol {
    

    private unowned let view: BonuceViewControllerProtocol

    required init(view: BonuceViewControllerProtocol) {
        self.view = view
    }
    
}
