//
//  NewsRepository.swift
//  NewsApp
//
//  Created by Skyio Team on 02/09/22.
//

import Foundation

final class NewsRepository : NSObject{
    static let shared = NewsRepository()
    private var baseUrl = "https://newsapi.org/v2/top-headlines?country=br&apiKey={apiKey}"
    private var appetizerUrl = ""
    
    private override init() {}
    
    func getNews(search: String?,completed: @escaping (Result<[News], APError>) -> Void){
        if(search != nil){
            appetizerUrl = baseUrl + "&q=" + search!
        }
        guard let url = URL(string: appetizerUrl) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(NewsResponse.self, from: data)
                completed(.success(decodedResponse.articles))
            }catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
