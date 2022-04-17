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
     case PATH 
     case ENTITY
}



protocol IITunesService {
    func fetchAllDatas(searchText: String, response: @escaping ([Result]?) -> Void)
}




class ITunesService: IITunesService {
    let customDecoder = JSONDecoder()
    let dateFormater = DateFormatter()
    var entity = ""

    func fetchAllDatas(searchText: String, response: @escaping ([Result]?) -> Void) {
        let urlToSearch = ITunesServiceEndPoint.BASE_URL.rawValue + searchText + entity
        
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        customDecoder.dateDecodingStrategy = .formatted(dateFormater)
        AF.request(urlToSearch).responseDecodable(of: ITunesModel.self, decoder: customDecoder) { model in
            guard let data = model.value else {
                let err = model.error
                print(err as Any)
                response(nil)
                return
            }
            
            print(urlToSearch)
            response(data.results)
        }
    }
}
