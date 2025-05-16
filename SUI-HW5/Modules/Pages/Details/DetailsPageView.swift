//
//  Untitled.swift
//  SUI-HW5
//
//  Created by Dim on 10.05.2025.
//

import SwiftUI

struct DetailsPageView: View {
    @ObservedObject var viewModel: DetailsPageViewModel
    @State var commentText: String = ""
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(viewModel.detailedPost.pictures, id: \.self) { picture in
                                Image(picture)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 500)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                
                            }
                        }
                        .padding(.top, 100)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.detailedPost.tags, id: \.self) { tag in
                                Text(tag)
                                    .lineLimit(1)
                                    .foregroundStyle(.primary)
                                    .padding(7)
                                    .padding(.horizontal, 7)
                                    .background(.secondary)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    
                    Text(viewModel.detailedPost.text)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    if let coments = viewModel.detailedPost.coments {
                        ForEach(coments, id: \.self) { coment in
                            VStack(alignment: .leading) {
                                Text(coment.date)
                                    .foregroundStyle(.secondary)
                                Text(coment.text)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(.ultraThickMaterial)
            
            VStack {
                ZStack(alignment: .top) {
                    Rectangle()
                        .fill(.thinMaterial)
                        .frame(height: 180)
                        .mask(LinearGradient(
                            gradient: Gradient(colors: [.black, .black, .black, .clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .ignoresSafeArea()
                        .allowsHitTesting(false)
                    
                    HStack {
                        Button {
                            self.path.removeLast()
                        } label: {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .padding(7)
                        }
                        .foregroundStyle(.primary)
                        
                        VStack {
                            if let date = viewModel.detailedPost.date {
                                Text(date)
                                    .lineLimit(1)
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            if let year = viewModel.detailedPost.year {
                                Text(year)
                                    .lineLimit(1)
                                    .foregroundStyle(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        Image(systemName: "line.horizontal.3.decrease")
                            .imageScale(.large)
                            .foregroundStyle(.primary)
                            .padding(7)
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 60)
                }
                
                Spacer()
                
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(.thinMaterial)
                        .frame(height: 120)
                        .mask(LinearGradient(
                            gradient: Gradient(colors: [.clear, .black, .black, .black]),
                            startPoint: .top,
                            endPoint: .bottom
                        ))
                        .ignoresSafeArea()
                        .allowsHitTesting(false)
                    
                    TextField("Comment", text: $commentText)
                        .padding()
                        .foregroundStyle(.primary)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                        .shadow(radius: 10)
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
    }
}

//#Preview {
//
//    DetailsPageView(viewModel: DetailsPageViewModel(post: PostModel(photoesCount: 3, commentsCount: 10, tags: ["#apple", "#swift", "#ui"], text: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem! Lorem ipsum dolor sit amet consectetur adipisicing elit. Quo, voluptatem!", imageResource: "poster3")))
//}
