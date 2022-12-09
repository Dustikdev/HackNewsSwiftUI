//
//  NetworkManager.swift
//  HackNewsSwiftUI
//
//  Created by Никита Швец on 08.12.2022.
//

import Foundation


class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let task = URLSession(configuration: .default).dataTask(with: url) { data, urlresponse, error in
                if error != nil {
                    print(error!)
                } else {
                    if let safeData = data {
                        do {
                            let decodedData = try JSONDecoder().decode(NewsData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = decodedData.hits
                            }
//                            print(decodedData)
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}
