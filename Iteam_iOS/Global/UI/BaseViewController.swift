//
//  BaseViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    func configure(){}
    func addview(){}
    func layout(){}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.addview()
        self.layout()
    }
}
