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
        
        let listVC = ListViewController()
        let addItemVC = AddItemViewController()
        
        let navigationController = UINavigationController(rootViewController: listVC)
        
        let listVM = ListViewModel()
        let addItemVM = AddItemViewModel()

        listVM.onOpenAddVC = { [] in
            navigationController.pushViewController(addItemVC, animated: true)
        }
        
        addItemVM.onOpenListVC = { [] in
            navigationController.popToRootViewController(animated: true)
        }
        
        listVC.configure(listViewModel: listVM)
        addItemVC.configure(addItemViewModel: addItemVM)
        
        window?.rootViewController = navigationController
        
        return true
    }
    
    
}
