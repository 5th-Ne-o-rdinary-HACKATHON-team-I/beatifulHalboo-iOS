//
//  Fonts+.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/25.
//

import Foundation
import UIKit

extension UIFont {
    public enum PretendardType: String {
        case Bold = "Bold"
        case Medium = "Medium"
        case Regular = "Regular"
        case ExtraBold = "ExtraBold"
        case Heavy = "Heavy"
        case Light = "Light"
        case Thin = "Thin"
        case SemiBold = "SemiBold"
    }
    static func pretendard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "SUIT-\(type.rawValue)", size: size) ?? .systemFont(ofSize: size)
    }
    
    static let title1 = UIFont(name: "SUIT-\(PretendardType.Bold.rawValue)", size: 32)
    static let title2 = UIFont(name: "SUIT-\(PretendardType.Medium.rawValue)", size: 32)
    static let subTitle1 = UIFont(name: "SUIT-\(PretendardType.Bold.rawValue)", size: 20)
    static let subTitle2 = UIFont(name: "SUIT-\(PretendardType.Medium.rawValue)", size: 20)
    static let body1 = UIFont(name: "SUIT-\(PretendardType.Medium.rawValue)", size: 16)
    static let body2 = UIFont(name: "SUIT-\(PretendardType.Regular.rawValue)", size: 16)
    static let caption1 = UIFont(name: "SUIT-\(PretendardType.Medium.rawValue)", size: 13)
    static let caption2 = UIFont(name: "SUIT-\(PretendardType.Regular.rawValue)", size: 13)
    static let caption3 = UIFont(name: "SUIT-\(PretendardType.Regular.rawValue)", size: 10)
}
