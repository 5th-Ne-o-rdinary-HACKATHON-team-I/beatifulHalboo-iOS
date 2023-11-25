//
//  ViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

//  test

import UIKit

class ViewController: BaseViewController {
    
    private let label = UILabel().then {
        $0.text = "assfsf"
        $0.font = .pretendard(.Bold, size: 23)
        $0.textColor = .black
        $0.sizeToFit()
    }
    
    override func configure() {
        self.view.backgroundColor = .white
    }
    
    override func addview() {
        self.view.addSubview(label)
    }
    
    override func layout() {
        self.label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

