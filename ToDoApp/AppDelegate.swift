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
        
        let listViewController = ListViewController()
        let addItemViewController = AddItemViewController()
        
        let navigationController = UINavigationController(rootViewController: listViewController)
    
        let listViewModel = ListViewModel()
        let addItemViewModel = AddItemViewModel()
        
        
        listViewModel.onOpenAddVC = { [] in
            navigationController.pushViewController(addItemViewController, animated: true)
        }
        
        addItemViewModel.onOpenListVC = { [] in
            navigationController.popToRootViewController(animated: true)
        }
        
        
        listViewController.configure(listViewModel: listViewModel)
        addItemViewController.configure(addItemViewModel: addItemViewModel)
        
        window?.rootViewController = navigationController
        
        return true
    }
    
    
    func makeListViewController() -> UIViewController {
        let listViewController = ListViewController()
        return listViewController
    }


}

