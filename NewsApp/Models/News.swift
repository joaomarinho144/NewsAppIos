//
//  News.swift
//  NewsApp
//
//  Created by Skyio Team on 01/09/22.
//

import Foundation


struct News: Codable{
    var source: Source?
    var author, title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var content: String?
    
    init(author: String, title: String, description: String, url: String, urlToImage: String, content: String){
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.content = content
    }
}

extension News{
    static let news = News(author: "CNN", title: "How to Install Unsupported Apps on Older iPhones", description: "As much as Apple will want you to buy the iPhone 14, your old phone is probably serving you just fine, even if the company doesn’t officially support it anymore. But the bigger problem with aging tech isn’t necessarily the lack of official software support", url: "https://lifehacker.com/how-to-install-unsupported-apps-on-older-iphones-1849485024", urlToImage: "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/6b00d6118ad983898709847f6494e939.jpg", content: "As much as Apple will want you to buy the iPhone 14, your old phone is probably serving you just fine, even if the company doesnt officially support it anymore. But the bigger problem with aging tech")
    static let sampleData: [News] =
    [
        news, news, news, news,news,news,news,news,news,news
    ]
    
    
}

struct NewsResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [News]
}

struct Source: Codable {
    var id: String?
    var name: String?
}
