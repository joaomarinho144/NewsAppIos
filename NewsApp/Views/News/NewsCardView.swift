//
//  NewsCardView.swift
//  NewsApp
//
//  Created by Skyio Team on 01/09/22.
//

import SwiftUI

struct NewsCardView: View {
    let news: News
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
                Text(news.title ?? "").font(.headline)
                Spacer(minLength: 15)
                Text(news.description ?? "").font(.subheadline)
                Spacer(minLength: 10)
                Text(news.author ?? "").font(.caption)
            }
            AsyncImage(url: URL(string:news.urlToImage ?? "https://google.com")!, placeholder: {Text("Loading")})
                .frame(maxWidth: 80, maxHeight: 80)
        }
    }
}

struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news: News.sampleData[0])
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
