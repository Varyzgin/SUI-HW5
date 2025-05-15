//
//  PostView.swift
//  SUI-HW5
//
//  Created by Dim on 15.05.2025.
//

import SwiftUI

struct PostView: View {
    @Binding var path: NavigationPath
    @StateObject var viewModel: PostViewModel
    
    init(path: Binding<NavigationPath>, postModel: PostModel) {
        self._path = path
        viewModel.model = postModel
    }
    
    var body: some View {
        Button {
            path.append(Router.details)
        } label: {
            Image(viewModel.model.imageResource)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.width - 30)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        HStack {
                            Text(
                                viewModel.Rus(number: viewModel.model.photoesCount, oneTwoMore: "Фотография", "Фотографии", "Фотографий")
                            )
                            .lineLimit(1)
                            .foregroundStyle(.ultraThickMaterial)
                            .shadow(radius: 3)
                            Spacer()
                            Text(
                                viewModel.Rus(number: viewModel.model.commentsCount, oneTwoMore: "Коментарий", "Коментария", "Коментариев")
                            )
                            .lineLimit(1)
                            .foregroundStyle(.ultraThickMaterial)
                            .shadow(radius: 3)
                        }
                        .padding(.horizontal)
                        .foregroundStyle(.ultraThickMaterial)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<viewModel.model.tags.count, id: \.self) { index in
                                Text(viewModel.model.tags[index])
                                    .lineLimit(1)
                                    .bold()
                                    .foregroundStyle(.ultraThickMaterial)
                                    .shadow(radius: 1)
                                    .padding(7)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Text(viewModel.model.text)
                        .lineLimit(3)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .foregroundStyle(.ultraThickMaterial)
                        .shadow(radius: 3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            
        }
    }
}
