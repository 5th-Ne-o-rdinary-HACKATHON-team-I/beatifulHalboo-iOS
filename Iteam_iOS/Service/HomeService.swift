//
//  HomeService.swift
//  Iteam_iOS
//
//  Created by 최지철 on 2023/11/26.
//

import Foundation
import Alamofire

struct SubscribeDTO: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result

    struct Result: Codable {
        let subscribes: [Subscribe]
        let totalMonthlyFees: Int

        struct Subscribe: Codable {
            let category: String
            let serviceName: String
            let subscriptionPeriod: Int
            let billingDueDate: String
        }
    }
}

class HomeService {
    func getSubscribesDataForMember(memberId: Int, page: Int, size: Int, orderby: String, sort: String, completion: @escaping (Result<SubscribeDTO, AFError>) -> Void) {
        let url = "http://3.38.79.42/subscribes/members/\(memberId)"
        let parameters: [String: Any] = ["page": page, "size": size, "orderby": orderby, "sort": sort]

        AF.request(url, method: .get, parameters: parameters)
            .responseDecodable(of: SubscribeDTO.self) { response in
                print(response.result)
        }
    }
}
