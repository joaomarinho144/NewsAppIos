//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Skyio Team on 02/09/22.
//

import Foundation

class NewsViewModel: ObservableObject{
    @Published var news: [News] = []
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    func getNews(search: String?){
        isLoading = true
        
        NewsRepository.shared.getNews(search: search) { [self] result in
            DispatchQueue.main.async{
                self.isLoading =  false
                
                switch result{
                case .success(let news): self.news = news
                    
                case .failure(let error):
                    switch error{
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
