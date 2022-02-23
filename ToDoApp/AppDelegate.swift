//
//  AppDelegate.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 15/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        navigationController = UINavigationController(rootViewController: makeListViewController())
    
        window?.rootViewController = navigationController
    
        return true
    }
    
    func makeListViewController() -> UIViewController {
        let viewController = ListViewController()
        let listViewModel = ListViewModel()
       // navigationController?.pushViewController(makeListViewController(), animated: true)
        
        listViewModel.onOpenAddVC = { [weak self] in
            guard let self = self else {return}
            self.navigationController?.pushViewController(self.makeAddItemViewController(listViewController: viewController), animated: true)
        }
        
        viewController.configure(listViewModel: listViewModel)
        return viewController
    }
    
    func makeAddItemViewController(listViewController: ListViewController) -> UIViewController {
        let viewController = AddItemViewController()
        let addItemViewModel = AddItemViewModel()
        
        addItemViewModel.onOpenListVC = { [weak self] in
            listViewController.updateTableView()
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
        viewController.configure(addItemViewModel: addItemViewModel)
        return viewController
    }
    

}
