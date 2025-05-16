//
//  Untitled.swift
//  SUI-HW5
//
//  Created by Dim on 10.05.2025.
//

import SwiftUI

struct MainPageView: View {
    @State var path: NavigationPath = NavigationPath()
    @StateObject var viewModel = MainPageViewModel()
    
    let posts: [PostModel] = [
        PostModel(photoesCount: 3, commentsCount: 10, tags: ["#apple", "#swift", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: "poster3"),
        PostModel(photoesCount: 2, commentsCount: 532, tags: ["#swift", "#apple", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: "poster1"),
        PostModel(photoesCount: 57, commentsCount: 34, tags: ["#swift", "#apple", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: "photo1"),
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 15) {
                        HStack {}.frame(height: 40)
                        ForEach(posts, id: \.id) { post in
                            let postViewModel = PostViewModel(post: post)
                            PostView(path: $path, viewModel: postViewModel)
                        }
                    }
                }
                .scrollIndicators(.visible)
                .navigationDestination(for: Router.self) { page in
                    SettingsPageView()
//                    switch page {
//                    case .detail:
//                        SettingsPageView()
//                    }
                }
                
                HStack {
                    Text("InstaPocket")
                        .lineLimit(1)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "gearshape")
                        .imageScale(.large)
                        .foregroundStyle(.primary)
                }
                .padding(.horizontal)
                .padding(.bottom, 7)
                .background(.ultraThickMaterial)
            }
            .background(.ultraThickMaterial)
        }
    }
}

#Preview {
    MainPageView()
}
