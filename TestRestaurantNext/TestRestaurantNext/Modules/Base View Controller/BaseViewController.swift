//
//  BaseViewController.swift
//  TestRestaurantNext
//
//  Created by Коля Мамчур on 24.03.2021.
//
import UIKit

protocol BaseViewControllerProtocol: class {
    func popToRootVC(animated: Bool)
    func popVC(animated: Bool)
    func pushToVC(_ vc: UIViewController, animated: Bool)
    func presentVC(_ vc: UIViewController, animated: Bool)
    func dismiss(animated: Bool)
   
}
