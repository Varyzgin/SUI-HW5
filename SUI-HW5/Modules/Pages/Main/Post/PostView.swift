//
//  PostView.swift
//  SUI-HW5
//
//  Created by Dim on 15.05.2025.
//

import SwiftUI

struct PostView: View {
    @Binding var path: NavigationPath
    @ObservedObject var viewModel: PostViewModel
    
    init(path: Binding<NavigationPath>, viewModel: PostViewModel) {
        self._path = path
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button {
            path.append(Router.details)
        } label: {
            ZStack {
                Image(viewModel.post.imageResource)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.width - 30)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Text(
                            viewModel.endingsRussification(number: viewModel.post.photoesCount, definition: (one: "Фотография", from2To4: "Фотографии", more: "Фотографий"))
                        )
                        .lineLimit(1)
                        .foregroundStyle(.ultraThickMaterial)
                        .shadow(radius: 3)
                        Spacer()
                        Text(
                            viewModel.endingsRussification(number: viewModel.post.commentsCount, definition: (one: "Коментарий", from2To4: "Коментария", more: "Коментариев"))
                        )
                        .lineLimit(1)
                        .foregroundStyle(.ultraThickMaterial)
                        .shadow(radius: 3)
                    }
                    .padding(.horizontal)
                    .foregroundStyle(.ultraThickMaterial)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<viewModel.post.tags.count, id: \.self) { index in
                                Text(viewModel.post.tags[index])
                                    .lineLimit(1)
                                    .bold()
                                    .foregroundStyle(.ultraThickMaterial)
                                    .shadow(radius: 1)
                                    .padding(7)
                                    .padding(.horizontal, 7)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text(viewModel.post.text)
                        .lineLimit(3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .foregroundStyle(.ultraThickMaterial)
                        .shadow(radius: 3)

                }
                .padding(.horizontal)
            }
        }
    }
}
