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
    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .top) {
                ScrollView {
                    VStack(spacing: 15) {
                        PostView(path: $path, viewModel: PostViewModel(post: PostModel(photoesCount: 3, commentsCount: 10, tags: ["#apple", "#swift", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: "poster3")))
//                        PostView(path: $path, photoesCount: 3, commentsCount: 10, tags: ["#apple", "#swift", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: .poster3)
                            .padding(.top, 50)
                        
//                        PostView(path: $path, photoesCount: 5, commentsCount: 10, tags: ["#apple", "#swift", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: .poster1)
//                        PostView(path: $path, photoesCount: 3, commentsCount: 10, tags: ["#apple", "#swift", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: .poster3)
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
