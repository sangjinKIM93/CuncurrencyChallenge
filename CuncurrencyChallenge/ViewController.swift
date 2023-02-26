//
//  ViewController.swift
//  CuncurrencyChallenge
//
//  Created by 광리자 on 2023/02/20.
//

import UIKit

class ViewController: UIViewController {

    let tableView = UITableView()
    let loadAllButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ImageTableViewCell.self, forCellReuseIdentifier: ImageTableViewCell.identifier)
        tableView.rowHeight = 100
        
        setupView()
    }
    
    private func setupView() {
        self.view.addSubview(tableView)
        self.view.addSubview(loadAllButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
        loadAllButton.translatesAutoresizingMaskIntoConstraints = false
        loadAllButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadAllButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        loadAllButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        loadAllButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        loadAllButton.setTitle("모두 받기", for: .normal)
        loadAllButton.backgroundColor = .yellow
        loadAllButton.setTitleColor(.black, for: .normal)
        loadAllButton.addTarget(self, action: #selector(didTapLoadAllButton), for: .touchUpInside)
    }
    
    @objc func didTapLoadAllButton() {
        for cell in tableView.visibleCells {
            if let cell = cell as? ImageTableViewCell {
                cell.configureImage(stringUrl: "https://www.treeinfo.net/data/file/ti_free/thumb-2001093550_ZYiXBxHv_acc30dee7d6f41bcd70cdde0f16214b6d21893d4_700x467.jpg")
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? ImageTableViewCell else {
            return
        }
        cell.configureImage(stringUrl: "https://www.treeinfo.net/data/file/ti_free/thumb-2001093550_ZYiXBxHv_acc30dee7d6f41bcd70cdde0f16214b6d21893d4_700x467.jpg")
    }
}
