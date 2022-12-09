//
//  NewsModel.swift
//  HackNewsSwiftUI
//
//  Created by Никита Швец on 08.12.2022.
//

import Foundation


struct NewsData: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
