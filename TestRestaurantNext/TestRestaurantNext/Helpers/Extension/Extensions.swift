//
//  Extensions.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 24.03.2021.
//

import UIKit

extension UIViewController {
    
    class func instance(_ storyboard: UIStoryboard.Storyboard) -> Self {
        
        let storyboard = UIStoryboard(storyboard: storyboard)
        let viewController = storyboard.instantiateViewController(self)
        
        return viewController
    }
    
    func popToRootVC(animated: Bool) {
        DispatchQueue.main.async {
           
            self.navigationController?.popToRootViewController(animated: animated)
        }
    }
    
    func popVC(animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: animated)
        }
    }
    
    func pushToVC(_ vc: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
           
            self.navigationController?.pushViewController(vc, animated: animated)
        }
    }
    
    func presentVC(_ vc: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.present(vc, animated: animated, completion: nil)
        }
    }
    
    func dismiss(animated: Bool) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension UIView {
    class var identifier: String {
        return String(describing: self)
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension UITableView {
    
    func create<T: UITableViewCell>(_ cell: T.Type, _ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath) as! T
    }
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        self.register(UINib(nibName: T.identifier, bundle: nil), forCellReuseIdentifier: T.identifier)
    }
    
}
