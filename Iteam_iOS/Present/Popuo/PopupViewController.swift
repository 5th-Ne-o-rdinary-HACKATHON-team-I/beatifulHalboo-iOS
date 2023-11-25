//
//  PopupViewController.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import UIKit

class PopupViewController: BaseViewController {
    
    private let titleLable = UILabel().then {
        $0.text = "회원정보 입력"
        $0.textColor = UIColor(hexString: "#FD442B")
        $0.font = UIFont.body1
        $0.sizeToFit()
    }
    private let infoLable = UILabel().then {
        $0.text = "월급정보"
        $0.textColor = .black
        $0.font = UIFont.body1
        $0.sizeToFit()
    }
    private let priceTextField = UITextField().then {
        $0.placeholder = "숫자를 입력하시면 자동으로 변환됩니다."
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
    }
    
    private let doneBtn = UIButton().then {
        $0.setTitle("등록하기", for: .normal)
        $0.titleLabel?.font = UIFont.caption2
        $0.tintColor = .white
        $0.layer.cornerRadius = 15
        $0.backgroundColor = UIColor(hexString: "#FD442B")
        
    }
    
    private let contentView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
    }
    
    override func configure() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.view.isOpaque = false
        self.doneBtn.addTarget(self, action:#selector(doneBtnTap), for: .touchUpInside)
        self.priceTextField.delegate = self

    }
    @objc func doneBtnTap() {
        self.dismiss(animated: false)
        
    }
    
    override func addview() {
        self.view.addSubview(contentView)
        self.contentView.addSubview(doneBtn)
        self.contentView.addSubview(titleLable)
        self.contentView.addSubview(infoLable)
        self.contentView.addSubview(priceTextField)

    }
    
    override func layout() {
        self.contentView.snp.makeConstraints{
            $0.height.equalTo(256)
            $0.width.equalTo(356)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        self.titleLable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(27)
            $0.leading.equalToSuperview().offset(17)
        }
        self.infoLable.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(17)
        }
        self.priceTextField.snp.makeConstraints {
            $0.top.equalTo(infoLable.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(17)
            $0.trailing.equalToSuperview().offset(-23)
            $0.height.equalTo(37)
        }
        self.doneBtn.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-22)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(42)
        }
    }
}
extension PopupViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }

        // 숫자와 백스페이스인 경우에만 동작하도록 함
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
        let invertedSet = allowedCharacterSet.inverted
        let components = string.components(separatedBy: invertedSet)
        let filtered = components.joined(separator: "")
        if string != filtered {
            return false
        }

        // 현재 텍스트에서 컴마 제거
        let currentTextWithoutComma = text.replacingOccurrences(of: ",", with: "")

        // 입력된 숫자에 쉼표 추가
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0

        if let number = formatter.number(from: currentTextWithoutComma + string) {
            textField.text = formatter.string(from: number)
            if number == 10000000{
                UserInfo.shared.safe = true

            }
        } else {
            textField.text = currentTextWithoutComma + string
        }
        


        return false
    }
}
