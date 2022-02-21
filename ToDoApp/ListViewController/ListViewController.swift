//
//  ViewController.swift
//  ToDoTable
//
//  Created by deniss.lobacs on 15/02/2022.
//

import UIKit

class ListViewController: UIViewController {
    
    private var tableView = UITableView()
    private var listViewModel: ListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func configure(listViewModel: ListViewModel) {
        self.listViewModel = listViewModel
    }
     
}

extension ListViewController {
    
    private func configTable() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        navigationItem.title = "ToDoList"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(goToAddListViewController))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    @objc private func goToAddListViewController() {
        listViewModel?.shouldOpenAddVC()
    }
}


extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel?.getTaskManager().data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableCell else {return UITableViewCell.init()}
        
        let titleText = listViewModel?.getTaskManager().getValue(index: indexPath.row)
        cell.titleLabel.text = titleText
        
        return cell
         
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

