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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let listViewModel = ListViewModel()
        let addItemViewModel = AddItemViewModel()
        
        
        let navigationController = UINavigationController(rootViewController: makeListViewController(viewModel: listViewModel))
        
        listViewModel.onOpenAddVC = { navigationController.pushViewController(self.makeAddItemViewController(viewModel: addItemViewModel), animated: true) }
        
        addItemViewModel.onOpenListVC = { navigationController.popToRootViewController(animated: true) }
        
      
        
        window?.rootViewController = navigationController
    
        return true
    }
    
    func makeListViewController(viewModel: ListViewModel) -> UIViewController {
        let viewController = ListViewController()
        viewController.configure(listViewModel: viewModel)
        return viewController
    }
    
    func makeAddItemViewController(viewModel: AddItemViewModel) -> UIViewController {
        let viewController = AddItemViewController()
        viewController.configure(addItemViewModel: viewModel)
        return viewController
    }
}
