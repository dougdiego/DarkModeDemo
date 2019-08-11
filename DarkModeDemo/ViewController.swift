//
//  ViewController.swift
//  DarkModeTest
//
//  Created by Doug Diego on 8/11/19.
//  Copyright © 2019 Doug Diego. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dark Mode Demo"
        setupInterface()
        setupConstraints()
    }

    func setupConstraints() { }

    func setupInterface() {
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(systemName: "gear"),
                            style: .plain,
                            target: self,
                            action: #selector(settingsButtonTouched(_:)))

    }

    @objc func settingsButtonTouched(_ button: UIBarButtonItem) {
        let vc = SettingsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
