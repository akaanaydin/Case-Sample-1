//
//  iTunesService.swift
//  CaseSample-1
//
//  Created by Arslan Kaan AYDIN on 16.04.2022.
//

import Alamofire
import Foundation


enum ITunesServiceEndPoint: String {
     case BASE_URL = "https://itunes.apple.com/search?term="
     case PATH = "ryan+reynolds"
     case LIMIT = "&limit=20"

     static func newsPath() -> String {
         "\(BASE_URL.rawValue)\(PATH.rawValue)\(LIMIT.rawValue)"
     }
}




protocol IITunesService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}




struct ITunesService: IITunesService {
    let customDecoder = JSONDecoder()
    let dateFormater = DateFormatter()
    
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        customDecoder.dateDecodingStrategy = .formatted(dateFormater)
        
        AF.request(ITunesServiceEndPoint.newsPath()).responseDecodable(of: ITunesModel.self, decoder: customDecoder) { model in
            guard let data = model.value else {
                let err = model.error
                print(err as Any)
                response(nil)
                return
            }
            response(data.results)
        }
    }
}
