//
//  SettingsViewController.swift
//  DarkModeTest
//
//  Created by Doug Diego on 8/11/19.
//  Copyright © 2019 Doug Diego. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    func setupInterface() {
        self.view.addSubview(self.tableView)
    }

    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        setupInterface()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier: String = "Cell"
        var cell: UITableViewCell? = (tableView.dequeueReusableCell(withIdentifier: identifier))
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "Appearance"

        cell?.detailTextLabel?.text = AppearanceState(rawValue: UserDefaultsConfig.appearanceState)?.name()

        return cell!
    }
}

// MARK: - UITableViewDelegate
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let vc = SettingsAppearanceViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
