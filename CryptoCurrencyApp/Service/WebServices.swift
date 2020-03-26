//
//  WebServices.swift
//  CryptoCurrencyApp
//
//  Created by MacxbookPro on 24.03.2020.
//  Copyright © 2020 MacxbookPro. All rights reserved.
//

import Foundation

class WebServices {
    
    func dowlandCurrencies(url:URL,completion:@escaping([CryptoCurrency]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let cryploList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryploList)
                if let cryploList = cryploList {
                    completion(cryploList)
                }
                
            }
        }.resume()
        
    }
}
