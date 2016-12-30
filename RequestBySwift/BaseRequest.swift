//
//  BaseRequest.swift
//  RequestBySwift
//
//  Created by 储诚鹏 on 16/12/29.
//  Copyright © 2016年 RUIYI. All rights reserved.
//

import UIKit
import Alamofire

func basePost(_ url:URLConvertible, pragmadic:Parameters? = nil,sBlock:@escaping ([String : Any]) -> Void, fBlock:@escaping (String) -> Void) {
    request(url, method: .post, parameters: pragmadic, encoding: JSONEncoding.default)
        .responseJSON {
            if let response = $0.result.value {
                sBlock(response as! [String : Any])
            }
            else {
                debugPrint($0.result.debugDescription)
            }
    }
}

func baseGet(_ url:URLConvertible,pragma:Parameters? = nil,header:[String:String]? = nil,sBlock:@escaping ([String : Any]) -> Void, fBlock:@escaping (String) -> Void) {
    
}

