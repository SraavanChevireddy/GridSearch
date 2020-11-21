//
//  GridViewModel.swift
//  GridSearch
//
//  Created by Sraavan Chevireddy on 11/21/20.
//

import SwiftUI

class GridViewModel : ObservableObject{
    @Published var results = [AppInformation]()
    
    init() {
            guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/100/explicit.json") else{
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                do{
                    let networkResponse = try JSONDecoder().decode(NetworkResponse.self, from: data!)
                    DispatchQueue.main.async { [weak self] in
                        if let self = self{
                            self.results = networkResponse.feed.results
                        }
                    }
                    print(networkResponse)
                }catch{
                    print("Unable to decode the reponse",error.localizedDescription)
                }
                
            }.resume()
    }
}


