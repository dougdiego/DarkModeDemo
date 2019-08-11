//
//  SettingsAppearanceViewController.swift
//  AppearanceTest
//
//  Created by Doug Diego on 8/11/19.
//  Copyright © 2019 Doug Diego. All rights reserved.
//

import UIKit

class SettingsAppearanceViewController: BaseViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        return tableView
    }()

    var viewModel: SettingsAppearanceViewModel {
        didSet {
            self.tableView.reloadData()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        self.viewModel = SettingsAppearanceViewModel()
        super.init(coder: aDecoder)
    }

    init() {
        self.viewModel = SettingsAppearanceViewModel()
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
        self.title = "Appearance"
        setupInterface()
        setupConstraints()
    }
}

// MARK: - UITableViewDataSource
extension SettingsAppearanceViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numOfRows(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let identifier: String = "Cell"
        var cell: UITableViewCell? = (tableView.dequeueReusableCell(withIdentifier: identifier))
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        let title = self.viewModel.title(indexPath)
        let isSelected =  self.viewModel.isSelected(indexPath)

        cell?.textLabel?.text = title
        if isSelected {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        return cell!
    }
}

// MARK: - UITableViewDelegate
extension SettingsAppearanceViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        UserDefaultsConfig.appearanceState = indexPath.row
        self.updateColorAppearance()
        self.tableView.reloadData()
    }
}

