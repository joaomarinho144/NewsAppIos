//
//  NewsView.swift
//  NewsApp
//
//  Created by Skyio Team on 01/09/22.
//

import SwiftUI

struct NewsView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State var search = ""
        
    var body: some View {
        
        ZStack{
            List(viewModel.news, id: \.url) { news in
                Link(destination: URL(string: news.url!)!) {
                    NewsCardView(news: news)
                }.foregroundColor(.black)
            }
            if viewModel.isLoading { LoadingView() }
        }.alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .onAppear{viewModel.getNews(search: search)}
        .onChange(of: search) { searchText in
            viewModel.getNews(search: search)
        }
        .searchable(text: $search, prompt: "Look for something")
        .navigationTitle("All news")
        
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
